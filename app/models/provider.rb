class Provider < ApplicationRecord
  scope :filter_by_type, -> (t) { where service_type: t }

  # name, type, description, phone, email, website
  validates :name, presence: true
  validates :service_type, inclusion: { in: SERVICE_TYPES,
    message: "%{value} is not a valid type" }
  validates :description, presence: true
  validates :phone, presence: true#, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Invalid phone number" }
  validates :email, presence: true#, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/, message: "Invalid email address" }
  #validates :website, presence: true#, format: { with: /[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/, message: "Invalid website" }

  has_many :services
  has_many :doctors
end
