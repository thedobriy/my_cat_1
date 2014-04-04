class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update]
  before_action :get_cities,   only: [:index, :sort_by_city]

  def index
    @companies = Company.paginate(page: params[:page]).per_page(10)
    # @companies = @companies.kolvo(params[:sort_by_city]) if params[:sort_by_city]
  end

  def sort_by_city
    @companies = Company.where("city_id = ?", params[:city_id]).paginate(page: params[:page]).per_page(10)
    render 'index'
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
                               :main_doctor_id, :type_company_id, :city_id)
    end

    def find_company
      @company = Company.find(params[:id])
    end

    def get_cities
      @cities = City.joins(:company).order('companies_count DESC').uniq
    end
end
