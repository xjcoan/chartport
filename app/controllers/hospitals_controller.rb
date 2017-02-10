class HospitalsController < ApplicationController
  before_action :require_user

  def new
    @page_title = "New Hospital"
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      redirect_to hospital_path(@hospital)
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Hospital"
    if Hospital.exists?(params[:id])
      @hospital = Hospital.find(params[:id])
    end
  end

  def update
    @hospital = Hosptial.find(params[:id])
    if @hospital.update(hospital_params)
      redirect_to hospital_path(@hospital)
    else
      render 'edit'
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
    @page_title = @hospital.name

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @hospital
      }
    end
  end

  def index
    @page_title = "Hospitals Index"
    @hospitals = Hospital.all.paginate(:page => 1, :per_page => 10)
    if params[:search]
      @hospitals = Hospital.where("name ILIKE ?", "%#{params[:search]}%").order("created_at DESC").paginate(:page => params[:page])
    else
      @hospitals = Hospital.all.order("created_at DESC")
    end

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @hospitals
      }
    end
  end

  def destroy
    @hospital = hospital.find(params[:id])
    @hospital.destroy

    redirect_to hospitals_path
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name, :street_address, :city, :state, :zipcode)
  end

end
