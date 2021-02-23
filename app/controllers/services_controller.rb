class ServicesController < ApplicationController
  http_basic_authenticate_with name: "webmaster2021", password: "doclineadmin", except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    sort = request.GET[:sort]

    if sort
      @services = Service.filter_by_type (sort)
    else
      @services = Service.all
    end
  end

  def show
  end

  def new
    @service = Service.new
    generate_options
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to service_path(@service), flash: { success: "Record successfully created!" }
    else
      generate_options
      render :new
    end
  end

  def edit
    generate_options
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service), flash: { success: "Record successfully updated!" }
    else
      generate_options
      render :edit
    end
  end

  def destroy
    @service.destroy

    redirect_to services_path, flash: { success: "Record successfully deleted!" }
  end

  private
    def service_params
      params.require(:service).permit(:name, :service_type, :description, :advertisement, :provider_id, :doctor_ids => [])
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def generate_options
      @providers = Provider.all
      @doctors = Doctor.all.map { |doc| ["#{doc.name} - #{doc.provider.name}", doc.id]}

      @type_options = []

      SERVICE_TYPES.each do |t|
        @type_options.push([t.capitalize, t])
      end

      @provider_options = []

      @providers.each do |provider|
        @provider_options.push(["#{provider.id.to_s} - #{provider.name}", provider.id])
      end
    end
end
