class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]


  def show
    @total_products = Product.count
    @total_catagories = Category.distinct.count
  end
end
