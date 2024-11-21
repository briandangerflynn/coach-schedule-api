class User < ApplicationRecord
  has_secure_password

  COACH = "coach"
  STUDENT = "student"

  validates :role, inclusion: [ COACH, STUDENT ]
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\(\d{3}\)-\d{3}-\d{4}\z/, message: "must be in the format (123)-123-1234" }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :appointments_as_student, class_name: "Appointment", foreign_key: "student_id"
  has_many :appointments_as_coach, class_name: "Appointment", foreign_key: "coach_id"

  def coach?
    role === COACH
  end

  def student?
    role === STUDENT
  end
end
