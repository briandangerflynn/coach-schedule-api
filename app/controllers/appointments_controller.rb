class AppointmentsController < ApplicationController
  before_action :authorized

  def index
    if current_user.coach?
      appointments = current_user.appointments_as_coach
      render json: appointments.to_json(include: {
        coach: { only: [ :first_name, :last_name, :phone ] },
        student: { only: [ :first_name, :last_name, :phone ] }
      })
    elsif current_user.student?
      appointments = current_user.appointments_as_student.or(Appointment.where(student: nil)).includes(:coach, :student)
      render json: appointments.to_json(include: {
        coach: { only: [ :first_name, :last_name, :phone ] },
        student: { only: [ :first_name, :last_name, :phone ] }
      })
    end
  end

  def show
    appointment = Appointment.find(params[:id])

    render json: appointment.to_json(include: {
      coach: { only: [ :first_name, :last_name, :phone ] },
      student: { only: [ :first_name, :last_name, :phone ] }
    })
  end

  def create
    if current_user.coach?
      appointment = Appointment.new(appointment_params)

      if appointment.save
        render json: appointment, status: :created
      else
        render json: appointment.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.update(appointment_params)

    if appointment.save
      render json: appointment.to_json(include: {
        coach: { only: [ :first_name, :last_name, :phone ] },
        student: { only: [ :first_name, :last_name, :phone ] }
      })
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy

    head :no_content
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :rating, :notes, :coach_id, :student_id)
  end
end
