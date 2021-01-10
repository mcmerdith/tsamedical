class Service < ApplicationRecord
  scope :filter_by_type, -> (t) { where service_type: t }

  # name, type, description, advertisement
  validates :name, presence: true
  validates :service_type, inclusion: { in: SERVICE_TYPES,
    message: "%{value} is not a valid type" }
  validates :description, presence: true
  validates :advertisement, presence: true

  belongs_to :provider
end
