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
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      redirect_to @service
    else
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
      params.require(:service).permit(:name, :type, :description, :advertisement)
    end
end
