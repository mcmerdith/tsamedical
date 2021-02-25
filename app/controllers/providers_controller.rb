class ProvidersController < ApplicationController
  http_basic_authenticate_with name: "webmaster2021", password: "doclineadmin", except: [:join, :index, :show]
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def join
    if request.post?
      if params[:company].blank? ||
        params[:email].blank? ||
        params[:phone].blank? ||
        params[:services].blank? ||
        params[:info].blank? then
        # If the form is missing fields, show a fake error message
        flash.now[:alert] = "One or more fields was blank or invalid"
      else
        # If the form is okay, show a fake confirm message
        flash.now[:success] = "Your request has been submitted. Expected response time is 1-3 business days."
        params[:company] = nil
        params[:email] = nil
        params[:phone] = nil
        params[:services] = nil
        params[:info] = nil
      end
    end
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
  end

  def new
    @provider = Provider.new
    generate_options()
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to provider_path(@provider), flash: { success: "Record successfully created!" }
    else
      generate_options()
      render :new
    end
  end

  def edit
    generate_options()
  end

  def update
    if @provider.update(provider_params)
      redirect_to provider_path(@provider), flash: { success: "Record successfully updated!" }
    else
      generate_options()
      render :edit
    end
  end

  def destroy
    @provider.destroy

    redirect_to providers_path, flash: { success: "Record successfully destroyed!" }
  end

  private
    def provider_params
      params.require(:provider).permit(:name, :service_type, :description, :phone, :email, :website)
    end

    def set_provider
      @provider = Provider.find(params[:id])
    end

    def generate_options
      @type_options = []

      SERVICE_TYPES.each do |t|
        @type_options.push([t.capitalize, t])
      end
    end
end
