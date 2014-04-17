class DoctorsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :get_all_specs, 
    only: [:index, :sort_by_both, :sort_by_speciality]
  before_action :get_all_cities,
    only: [:index, :sort_by_both, :sort_by_city]
  add_breadcrumb "Home", :root_path
  add_breadcrumb "All doctors", :doctors_path

  def index
    @doctors = Doctor.paginate(page: params[:page], :per_page => 10)
  end

  def sort_by_city
    @doctors = Doctor.where('city_id = ?', params[:city_id]).
      paginate(page: params[:page], :per_page =>10)
    get_specs
    @city = City.find(params[:city_id])
    add_breadcrumb "City", doctors_city_sort_url(params[:city_id])
    render 'index'
  end

  def sort_by_speciality
    @doctors = Doctor.where('speciality_id = ?', params[:speciality_id]).
      paginate(page: params[:page], :per_page =>10)
    get_cities
    render 'index'
  end

  def sort_by_both
    @doctors = Doctor.where('speciality_id = ? AND city_id = ?', 
                            params[:speciality_id], params[:city_id]).
      paginate(page: params[:page], :per_page =>10)
    render 'index'
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:success] = "Новый врач успешно добавлен"
      redirect_to doctors_url
    else
      render 'new'
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
  end

  def update
    if @doctor.update_attributes(doctor_params)
      flash[:success] = "Успешно обновлено"
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    @doctor.destroy
    flash[:success] = "Успешно удален"
    redirect_to doctors_url
  end

  private

    def doctor_params
      params.require(:doctor).permit(:name, :desc, :company_id, :city_id, 
                                     :speciality_id, :contacts)
    end

    def correct_user
      @doctor = Doctor.find(params[:id])
    #  redirect_to(root_url) unless current_user?(@user)
    end

    def get_all_cities
      @cities = City.joins(:doctor).order('doctors_count DESC').uniq
    end

    def get_all_specs
      @specialities = Speciality.joins(:doctor).order('doctors_count DESC').uniq
    end
    
    def get_specs
      @specialities = Speciality.joins(:doctor).
        where(doctors: {city_id: params[:city_id]}).uniq
    end

    def get_cities
      @cities = City.joins(:doctor).
        where(doctors: {speciality_id: params[:speciality_id]}).uniq
    end
end
