class TypeValidator < ActiveModel::Validator

  def validate(record)
    if record.service_type != record.provider.service_type
      record.errors.add :service_type, 'You must provide the same service as your parent company'
    end

    record.services.each do |service|
      if (record.service_type != service.service_type)
        record.errors.add :service_ids, 'Service "' + service.name + '" is an invalid type (' + service.service_type.capitalize + ')'
      end
    end
  end
end

class Doctor < ApplicationRecord
  scope :filter_by_type, ->(t) { where service_type: t }
  scope :filter_by_provider, ->(p) { where provider_id: p }

  validates_with TypeValidator
  validates :name, presence: true
  validates :service_type, inclusion: { in: SERVICE_TYPES,
                                        message: '%{value} is not a valid type' }
  validates :date_registered, presence: true

  has_and_belongs_to_many :services
  belongs_to :provider
end
