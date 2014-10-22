class Poll < ActiveRecord::Base

  scope :current_election_year, ->{where(election_year: Time.now.year)}

end
