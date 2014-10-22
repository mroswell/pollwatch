class PollsController < ApplicationController
  before_action :check_params

  def index
    @polls = Poll.current_election_year.all
    render json: {polls: @polls}
  end

  def show
    render json: {}
  end

  def state_of_zip
    render json: {}
  end

  def polls_in_zip
    render json: {}
  end
end
