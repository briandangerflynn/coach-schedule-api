class Appointment < ApplicationRecord
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id", optional: true

  before_validation :set_end_time, on: [ :create, :update ]

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :coach, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true

  private

  def set_end_time
    if start_time.present?
      self.end_time = start_time + 2.hours
    end
  end
end
