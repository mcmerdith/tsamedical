class AppointmentsController < ApplicationController
  http_basic_authenticate_with name: "mcmerdith", password: "password", only: :index

  def all
    @appointments = Appointment.all
    @all = true
    render :search
  end

  def my
    if params[:reset]
      reset_session
    end

    if has_session()
      flash.keep
      redirect_to appointments_search_path
    end
  end

  def search
    get_session
    @appointments = Appointment.find_by_person(@fname, @lname, @dob)
  end

  # Resource Routes
  def new
    generate_services
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      session_update(@appointment.fname, @appointment.lname, @appointment.dob)
      redirect_to appointments_search_path, flash: { success: "Appointment Scheduled!" }
    else
      generate_services
      render :new
    end
  end

  def edit
    generate_services
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to appointments_search_path, flash: { success: "Appointment Modified!" }
    else
      generate_services
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    redirect_to appointments_search_path, flash: { success: "Appointment Cancelled!" }
  end

  # Updating the 3 stored session parameters
  def session_update(fname, lname, dob)
    session[:app_fname] = fname
    session[:app_lname] = lname
    session[:app_dob] = dob
  end

  private
    def appointment_params
      params.require(:appointment).permit(:fname, :lname, :dob, :date, :time, :service_id)
    end

    def generate_services
      @services = Service.all

      @service_options = []

      @services.each do |s|
        @service_options.push(["#{s.name} (by: #{s.provider.name})", s.id])
      end
    end

    def has_session
      return !(session[:app_fname].blank? || session[:app_lname].blank? || session[:app_dob].blank?)
    end

    def get_session
      @fname = session[:app_fname] ||= params[:fname]
      @lname = session[:app_lname] ||= params[:lname]
      @dob = session[:app_dob] ||= params[:dob]
    end
end
