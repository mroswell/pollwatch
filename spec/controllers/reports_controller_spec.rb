require 'rails_helper'

RSpec.describe ReportsController, :type => :controller do
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
        # Current year's reports
        current = create_list(:report, 5, election_year: election_year)
        # Last year's reports
        last_year = create_list(:report, 5, election_year: election_year - 1)
        # Concatenae and return
        @reports = current + last_year
      end

      it "should return all reports for current election year" do
        get action, valid_attrs, format: :json
        # Collect the years from the response
        res_years = json['reports'].map{|item|item['election_year']}.uniq
        expect(res_years).to have(1).item
        expect(res_years.first).to eq election_year
      end
    end

    context "scoped by a geolocation" do
      let(:envelope) { [{:lat => 5.5274443626, :lng => 50.4825973569},{:lat => 11.0523529053, :lng => 47.808380127}] }

      before(:example) do
        @reports = create_list(:report, 5, within: envelope)
      end
      # let(:other_reports) { create_list(:poll, 5, not_within: envelope) }

      it "should return all reports within the envelope" do
        get action, format: :json
        max_lng = envelope.map{|item| item[:lng] }.max
        max_lat = envelope.map{|item| item[:lat] }.max

        all_within_envelope = json['reports'].all?{|report| report['latitude'].abs < max_lat && report['longitude'].abs < max_lng }

        expect(all_within_envelope).to eq true
      end

      xit "should not return any reports outside the envelope" do
        pending "I need to write a 'not_within' factory"

        get action, valid_attrs, format: :json

        id_arr_1 = json['reports'].map{|report| report['id'].to_i }
        id_arr_2 = other_reports.map(&:id)
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

  describe "POST 'create'" do
    let(:valid_attrs) { {} }
    let(:action) { 'create' }

    it "returns http success" do
      post action, valid_attrs, format: :json
      expect(response).to be_success
    end

    class_eval(CHECK_PARAMS)
  end


  describe "GET 'state_of_zip'" do
    let(:valid_attrs) { {} }
    let(:action) { 'state_of_zip' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)
  end

  describe "GET 'reports_in_zip'" do
    let(:valid_attrs) { {} }
    let(:action) { 'reports_in_zip' }

    class_eval(GET_HTTP_SUCCESS)
    class_eval(CHECK_PARAMS)
  end





end
