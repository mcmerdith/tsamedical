class ServiceTypeValidator < ActiveModel::Validator

  def validate(record)
    if record.service_type != record.provider.service_type
      record.errors.add :service_type, 'The service must be the same type as it\'s provider'
    end

    record.doctors.each do |doctor|
      if (record.service_type != doctor.service_type)
        record.errors.add :doctor_ids, 'Doctor "' + doctor.name + '" doesn\'t provide this service type'
      end
    end
  end
end

class Service < ApplicationRecord
  scope :filter_by_type, -> (t) { where service_type: t }
  scope :filter_by_provider, -> (p) { where provider_id: p }

  # name, type, description, advertisement
  validates :name, presence: true
  validates :service_type, inclusion: { in: SERVICE_TYPES,
    message: "%{value} is not a valid type" }
  validates :description, presence: true
  validates :advertisement, presence: true

  validates_with ServiceTypeValidator

  has_and_belongs_to_many :doctors

  belongs_to :provider
end
