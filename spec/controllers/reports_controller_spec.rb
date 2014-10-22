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




end
