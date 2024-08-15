class RootsController < ApplicationController
  def index
    p "root"
    @cats = Cat.all
    render 'cats/index'
  end
end
