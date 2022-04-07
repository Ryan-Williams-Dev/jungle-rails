class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    puts "HELLO I AM HERE ---- #{params[:category][:name]}"
    @category = Category.new(name: params[:category][:name])

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      redirect_to root_url
    end
  end

end
