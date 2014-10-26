require 'rails_helper'

RSpec.describe Report, :type => :model do
  context ".current_election_year" do
    it "should return reports from the current election year" do
      current_year = Time.now.year
      create_list(:report, 2, election_year: 2013)
      curYearReports = create_list(:report, 2, election_year: current_year)
      expect(Report.current_election_year.all).to eq curYearReports
    end
  end


end
