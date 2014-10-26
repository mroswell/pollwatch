class Report < ActiveRecord::Base
  belongs_to :poll

  scope :current_election_year, ->{where(election_year: Time.now.year)}

  paginates_per 100

  
end
