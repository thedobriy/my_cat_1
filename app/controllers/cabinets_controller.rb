class CabinetsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :get_all_cities,
    only: [:index, :sort_by_both, :sort_by_city, :show, :new, :edit]
  
  def index
    @cabinets = Cabinet.paginate(page: params[:page], :per_page => 9)
  end

  def sort_by_city
    @cabinets = Cabinet.where('city_id = ?', params[:city_id]).
      paginate(page: params[:page], :per_page =>10)
    @city = City.find(params[:city_id])
    add_breadcrumb "#{@city.name}", "#{@city.id}"
    render 'index'
  end

  def new
    @cabinet = Cabinet.new
  end

  def create
    @cabinet = Cabinet.new(cabinet_params)
    if @cabinet.save
      flash[:success] = "Новый кабинет успешно добавлен"
      redirect_to cabinets_url
    else
      render 'new'
    end
  end

  def show
    @cabinet = Cabinet.find(params[:id])
    @city = City.find(@cabinet.city_id)
    add_breadcrumb "#{@city.name}", "city/#{@city.id}"
    add_breadcrumb "#{@cabinet.name}"
  end
  
  def edit
  end
  
  def update
    if @cabinet.update_attributes(cabinet_params)
      flash[:success] = "Успешно обновлено"
      redirect_to @cabinet
    else
      render 'edit'
    end
  end

  def destroy
    @cabinet.destroy
    flash[:success] = "Успешно удален"
    redirect_to cabinets_url
  end
  
  private

    def cabinet_params
      params.require(:cabinet).permit(:name, :desc, :company_id, :city_id, 
                                    :adress, :shedule,)
    end

    def correct_user
      @cabinet = Cabinet.find(params[:id])
    end

    def get_all_cities
      @cities = City.joins(:cabinet).order('cabinets_count DESC').uniq
    end
    
  
end
