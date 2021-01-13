class Appointment < ApplicationRecord
  before_create :randomize_id
  scope :find_by_person, -> (fname, lname, dob) { where(fname: fname).where(lname: lname).where(dob: dob) }

  # fname,lname,dob,date
  validates :fname, :lname, :dob, :date, :time, presence: true

  has_one :service

  private
    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Appointment.where(id: self.id).exists?
    end
end
