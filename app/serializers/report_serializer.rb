class ReportSerializer < ActiveModel::Serializer
  attributes :election_id , :problems , :comment , :time_happened , :election_year, :latitude, :longitude

  has_one :poll

  def latitude
    object.poll.latitude
  end

  def longitude
    object.poll.longitude
  end
end
