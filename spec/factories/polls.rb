FactoryGirl.define do
  class GeoFetcher
    class << self
      def sign_of(x)
        "++-"[x <=> 0]
      end

      def fetch_within(arr,key)
        bound_1     = arr[0][key]
        bound_2     = arr[1][key]
        some_num_in_bet = rand * (bound_1 - bound_2).abs
        min = bound_2 > bound_1 ? bound_1 : bound_2
        eval("#{min} #{sign_of(min)} #{some_num_in_bet}")
      end

      def fetch_outside(arr,key)
        bound_1     = arr[0][key]
        bound_2     = arr[1][key]
        some_num_in_bet = rand * (bound_1 - bound_2).abs
        max = bound_2 > bound_1 ? bound_1 : bound_2
        eval("#{max} #{sign_of(max)} #{some_num_in_bet}")
      end

      def run(within,not_within,key)
        if within
          fetch_within(within,key)
        elsif not_within
          fetch_outside(within,key)
        else
          case key
          when :lng then Faker::Address.longitude
          when :lat then Faker::Address.latitude
          end
        end
      end
    end
  end

  factory :poll do
    transient do
      within false
      not_within false
    end
    location_name { Faker::Lorem.sentence }
    address {
      Faker::Address.street_name + " " + Faker::Address.street_address
    }
    latitude { GeoFetcher.run(within, not_within, :lat) }
    longitude { GeoFetcher.run(within, not_within, :lng) }
  end
end
