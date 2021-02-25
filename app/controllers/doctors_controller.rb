class DoctorsController < ApplicationController
  http_basic_authenticate_with name: "webmaster2021", password: "doclineadmin", except: [:index, :show]
  before_action :set_doctor, only: %i[show edit update destroy]

  rescue_from PG::ForeignKeyViolation, with: :referenced_error
  def referenced_error
    redirect_to doctors_path, flash: { alert: "Can't delete Doctor as it is still referenced by a Service or Provider" }
  end

  # GET /doctors
  # GET /doctors.json
  def index
    sort = request.GET[:sort]

    @doctors = if sort
                 Doctor.filter_by_type(sort)
               else
                 Doctor.all
               end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show; end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    generate_options
  end

  # GET /doctors/1/edit
  def edit
    generate_options
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctor_url(@doctor), flash: { success: 'Record successfully created!' }
    else
      generate_options
      render :new
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_url(@doctor), flash: { success: 'Record successfully updated!' }
    else
      generate_options
      render :edit
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy

    redirect_to doctors_path, flash: { success: 'Record successfully deleted!' }
  end

  private

  def generate_options
    @providers = Provider.all
    @services = Service.all.map { |service| ["#{service.name} - #{service.provider.name}", service.id]}

    @type_options = []

    SERVICE_TYPES.each do |t|
      @type_options.push([t.capitalize, t])
    end

    @provider_options = []

    @providers.each do |provider|
      @provider_options.push(["#{provider.id} - #{provider.name}", provider.id])
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:name, :date_registered, :service_type, :provider_id, :profile_picture_url, :service_ids => [])
  end
end
