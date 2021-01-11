class ServicesController < ApplicationController
  http_basic_authenticate_with name: "mcmerdith", password: "password", except: [:index, :show]

  def index
    sort = request.GET[:sort]

    if sort
      @services = Service.filter_by_type (sort)
    else
      @services = Service.all
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
    generate_options()
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to service_url(@service), flash: { success: "Record successfully created!" }
    else
      generate_options()
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
    generate_options()
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      redirect_to service_url(@service), flash: { success: "Record successfully updated!" }
    else
      generate_options()
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to root_path
  end

  private
    def service_params
      params.require(:service).permit(:name, :service_type, :description, :advertisement, :provider_id)
    end

    def generate_options
      @providers = Provider.all

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
