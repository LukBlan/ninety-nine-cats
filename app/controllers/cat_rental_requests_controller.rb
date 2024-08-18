class CatRentalRequestsController < ApplicationController
  before_action :redirect_to_login, only: [:new, :create, :approve, :deny]
  before_action :redirect_on_not_owned_cat, only: [:approve, :deny]
  def new
    @cats = Cat.all
    render :new
  end

  def create
    rental_request = CatRentalRequest.new(cat_rental_request_params)

    if rental_request.save
      redirect_to cats_url
    else
      redirect_to new_cat_rental_request_url
    end
  end

  def approve
    rental_request = CatRentalRequest.find_by(id: params[:id])
    rental_request.approve!
    redirect_to cat_url(rental_request.cat_id)
  end

  def deny
    rental_request = CatRentalRequest.find_by(id: params[:id])
    rental_request.deni!
    redirect_to cat_url(rental_request.cat_id)
  end

  private
  def cat_rental_request_params
    params.require(:rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
