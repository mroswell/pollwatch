class Poll < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  # geocoded_by :fullAddress

  # after_validation :geocode


  # def fullAddress
  #   # Handle the case where the address is a hash
  #   if address['line1'].present?
  #     "#{address['line1']}, #{address['city']}, #{address['state']}, #{address['zip']}"
  #   else
  #     # Address is a string
  #     address
  #   end
  # end
end
