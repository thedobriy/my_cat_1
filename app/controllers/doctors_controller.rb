class DoctorsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @doctors = Doctor.paginate(page: params[:page])
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
      params.require(:doctor).permit(:name, :desc, :company_id, 
                                     :speciality_id, :contacts)
    end

    def correct_user
      @doctor = Doctor.find(params[:id])
    #  redirect_to(root_url) unless current_user?(@user)
    end

end
