class CatRentalRequestsController < ApplicationController
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

  private
  def cat_rental_request_params
    params.require(:rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
