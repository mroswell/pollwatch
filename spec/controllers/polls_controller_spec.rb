require 'rails_helper'

RSpec.describe PollsController, :type => :controller do
  GET_HTTP_SUCCESS = %Q{
    it "returns http success" do
      get action, valid_attrs, format: :json
      expect(response).to be_success
    end
  }
  CHECK_PARAMS = %Q{
    it "checks for params" do
      expect(controller).to receive(:check_params)
      get action, valid_attrs, format: :json
    end
  }

  describe "GET 'index'" do
    let(:valid_attrs) { {} }
    let(:action) { 'index' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)

    context "scoped by election year 2014" do
      let(:election_year) { 2014 }

      before(:example) do
        # Current year's polls
        current = create_list(:poll, 5, election_year: election_year)
        # Last year's polls
        last_year = create_list(:poll, 5, election_year: election_year - 1)
        # Concatenae and return
        @polls = current + last_year
      end

      it "should return all polling places for current election year" do
        get action, valid_attrs, format: :json
        # Collect the years from the response
        res_years = json['polls'].map{|item|item['election_year']}.uniq
        expect(res_years).to have(1).item
        expect(res_years.first).to eq election_year
      end
    end

    context "scoped by a geolocation" do
      let(:envelope) { [{:lat => 5.5274443626, :lng => 50.4825973569},{:lat => 11.0523529053, :lng => 47.808380127}] }

      before(:example) do
        @polls = create_list(:poll, 5, within: envelope)
      end
      # let(:other_polls) { create_list(:poll, 5, not_within: envelope) }

      it "should return all polling places within the envelope" do
        get action, format: :json
        max_lng = envelope.map{|item| item[:lng] }.max
        max_lat = envelope.map{|item| item[:lat] }.max

        all_within_envelope = json['polls'].all?{|poll| poll['latitude'].abs < max_lat && poll['longitude'].abs < max_lng }

        expect(all_within_envelope).to eq true
      end

      xit "should not return any polling places outside the envelope" do
        pending "I need to write a 'not_within' factory"

        get action, valid_attrs, format: :json

        id_arr_1 = json['polls'].map{|poll| poll['id'].to_i }
        id_arr_2 = other_polls.map(&:id)
        expect(id_arr_1.uniq).to_not eq id_arr_2.uniq
      end

    end


  end

  describe "GET 'show'" do
    let(:valid_attrs) { {id: 1} }
    let(:action) { 'show' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)
  end

  describe "GET 'state_of_zip'" do
    let(:valid_attrs) { {} }
    let(:action) { 'state_of_zip' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)
  end

  describe "GET 'polls_in_zip'" do
    let(:valid_attrs) { {} }
    let(:action) { 'polls_in_zip' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)
  end

end
