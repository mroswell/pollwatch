class ReportsController < ApplicationController
  before_action :check_params

  def index
    @polls = Report.current_election_year.all
    render json: {reports: @polls}
  end


  def show
    render json: {}
  end

  def create
    render json: {}
  end

  def reports_in_zip
    render json: {}
  end

  def state_of_zip
    render json: {}
  end
end
