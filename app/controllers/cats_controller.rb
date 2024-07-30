class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @rental_requests = Cat.select("cats.*, start_date, end_date")
                          .where(id: params[:id])
                          .left_joins(:cat_rental_requests)
                          .order("start_date ASC")

    if !@rental_requests.empty?
      @cat = @rental_requests[0]
      render :show
    else
      redirect_to cats_url
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    cat = Cat.new(cat_params)

    if cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])

    if @cat
      render :edit
    else
      redirect_to cats_url
    end


  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
