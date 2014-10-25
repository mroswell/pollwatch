FactoryGirl.define do


  factory :report do

    transient do
      within false
      not_within false
    end

    election_year { Time.now.year }

    election_id  { Faker::Number.number(4) }
    problems { Faker::Lorem.word }
    comment { Faker::Number.sentence(1) }
    contact_method {
      [Faker::Internet.email,Faker::PhoneNumber.phone_number][rand.round]
    }
    time_happened { Time.now }
    election_year { Time.now.year }

    before_create do
      # TODO: find or create a poll that fit the parameters
    end
  end

end
