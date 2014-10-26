FactoryGirl.define do
  factory :report do
    election_id  { Faker::Number.number(4) }
    problems { Faker::Lorem.word }
    comment { Faker::Lorem.sentence(1) }
    contact_method {
      [Faker::Internet.email,Faker::PhoneNumber.phone_number][rand.round]
    }
    time_happened { Time.now }
    election_year { Time.now.year }


    transient do
      within false
      not_within false
    end

    poll { create(:poll, within: within, not_within: not_within)}
    
  end

end
