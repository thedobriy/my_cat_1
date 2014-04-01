class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update]

  def index
    @companies = Company.paginate(page: params[:page])
  end
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company added"
      redirect_to companies_url
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update_attributes(company_params)
      flash[:success] = "Успешно обновлено"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id]).destroy
    flash[:success] = "Company deleted"
    redirect_to companies_url
  end

  private
    def company_params
      params.require(:company).permit(:name, :desc, :adress, :contacts, 
                               :main_doctor_id, :type_company_id)
    end

    def find_company
      @company = Company.find(params[:id])
    end
end
