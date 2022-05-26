class GlampingSetsController < ApplicationController

  def index
    @glamping_sets = GlampingSet.all.reverse
  end

  def new
    @glamping_set = GlampingSet.new
  end

  def create
    @glamping_set = GlampingSet.new(glamping_set_params)
    @glamping_set.user = current_user
    @glamping_set.save
  # No need for app/views/glamping_sets/create.html.erb
    redirect_to glamping_set_path(@glamping_set)
  end

  def show
    @glamping_set = GlampingSet.find(params[:id])
  end

  # def edit
  #   @glamping_set = GlampingSet.find(params[:id])
  # end

  def update
    @glamping_set = GlampingSet.find(params[:id])
    @glamping_set.update(glamping_set_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to glamping_set_path(@glamping_set)
  end

  def destroy
    @glamping_set = GlampingSet.find(params[:id])
    @glamping_set.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to glamping_sets_path, status: :see_other
  end

  private

  def glamping_set_params
    params.require(:glamping_set).permit(:name, :description, :total_oppupancy, :price_per_night, :photo)
  end


end
