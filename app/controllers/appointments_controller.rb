class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all

    render("appointment_templates/index.html.erb")
  end

  def show
    @appointment = Appointment.find(params.fetch("id_to_display"))

    render("appointment_templates/show.html.erb")
  end

  def new_form
    @appointment = Appointment.new

    render("appointment_templates/new_form.html.erb")
  end

  def create_row
    @appointment = Appointment.new

    @appointment.user_id = params.fetch("user_id")
    @appointment.starts_at = params.fetch("starts_at")
    @appointment.ends_at = params.fetch("ends_at")

    if @appointment.valid?
      @appointment.save

      redirect_back(:fallback_location => "/appointments", :notice => "Appointment created successfully.")
    else
      render("appointment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @appointment = Appointment.find(params.fetch("prefill_with_id"))

    render("appointment_templates/edit_form.html.erb")
  end

  def update_row
    @appointment = Appointment.find(params.fetch("id_to_modify"))

    @appointment.user_id = params.fetch("user_id")
    @appointment.starts_at = params.fetch("starts_at")
    @appointment.ends_at = params.fetch("ends_at")

    if @appointment.valid?
      @appointment.save

      redirect_to("/appointments/#{@appointment.id}", :notice => "Appointment updated successfully.")
    else
      render("appointment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @appointment = Appointment.find(params.fetch("id_to_remove"))

    @appointment.destroy

    redirect_to("/appointments", :notice => "Appointment deleted successfully.")
  end
end