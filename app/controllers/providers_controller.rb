class ProvidersController < ApplicationController
  http_basic_authenticate_with name: "mcmerdith", password: "password", except: [:join, :index, :show]

  def join
  end

  def index
    sort = request.GET[:sort]

    if sort
      @providers = Provider.filter_by_type (sort)
    else
      @providers = Provider.all
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def new
    @provider = Provider.new
    generate_options()
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to provider_url(@provider), flash: { success: "Record successfully created!" }
    else
      generate_options()
      render :new
    end
  end

  def edit
    @provider = Provider.find(params[:id])
    generate_options()
  end

  def update
    @provider = Provider.find(params[:id])

    if @provider.update(provider_params)
      redirect_to provider_url(@provider), flash: { success: "Record successfully updated!" }
    else
      generate_options()
      render :edit
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy

    redirect_to root_path
  end

  private
    def provider_params
      params.require(:provider).permit(:name, :service_type, :description, :phone, :email, :website)
    end

    def generate_options
      @type_options = []

      SERVICE_TYPES.each do |t|
        @type_options.push([t.capitalize, t])
      end
    end
end
