class FiltersController < ApplicationController
  def index
    @filters = current_user.filters
    @dogs = Dog.all
    @filters.each do |filter|
      @dogs = filter.filter(@dogs)
    end

    @filter = @filters.new
  end

  def create
    @filter = current_user.filters.new(filter_params)
    if @filter.save
      flash[:alert]= "Your Preferences have been saved"
    else
      flash[:alert]="Your preference could not be saved"
    end
    redirect_to preferences_path
  end

  def edit
    @filter = current_user.filters.find(params[:id])
  end

  def update
    @filter = current_user.filters.find(params[:id])
    if @filter.update(filter_params)
      redirect_to preferences_path
    else
      render :edit
    end
  end

  private
  def filter_params
    params.require(:filter).permit(:type, :content)
  end
end
