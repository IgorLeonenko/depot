class StoreController < ApplicationController
  include CurrentCart
  
  before_action :set_cart
  skip_before_action :authorize

  def index
    @products = Product.order(:title)
    @counter = session[:counter]
    @counter.nil? ? @counter = 1 : @counter += 1
    session[:counter] = @counter
  end
end
