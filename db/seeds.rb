# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(first_name: "Student", last_name: "McStudent", email: "student@gmail.com", phone: "(123)-456-7890", role: "student", password: "asdf")
coach1 = User.create!(first_name: "Ted", last_name: "Lasso", email: "coach1@gmail.com", phone: "(123)-123-1234", role: "coach", password: "asdf")
coach2 = User.create!(first_name: "Chubbs", last_name: "Peterson", email: "coach2@gmail.com", phone: "(123)-123-4321", role: "coach", password: "asdf")
coach3 = User.create!(first_name: "Patches", last_name: "O'Houlihan", email: "coach3@gmail.com", phone: "(123)-123-7890", role: "coach", password: "asdf")

time_in_2_hours = Time.current + 2.hours
time_in_3_hours = Time.current + 3.hours


Appointment.create!([
  { start_time: Time.current, end_time: nil, coach: coach1, student: nil, rating: nil, notes: nil },
  { start_time: time_in_2_hours, end_time: nil, coach: coach1, student: nil, rating: nil, notes: nil },
  { start_time: time_in_3_hours, end_time: nil, coach: coach1, student: nil, rating: nil, notes: nil },
  { start_time: Time.current, end_time: nil, coach: coach2, student: nil, rating: nil, notes: nil },
  { start_time: time_in_2_hours, end_time: nil, coach: coach2, student: nil, rating: nil, notes: nil },
  { start_time: time_in_3_hours, end_time: nil, coach: coach2, student: nil, rating: nil, notes: nil },
  { start_time: Time.current, end_time: nil, coach: coach3, student: nil, rating: nil, notes: nil },
  { start_time: time_in_2_hours, end_time: nil, coach: coach3, student: nil, rating: nil, notes: nil },
  { start_time: time_in_3_hours, end_time: nil, coach: coach3, student: nil, rating: nil, notes: nil }
])
