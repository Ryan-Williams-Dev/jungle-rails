require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'Saves succesfully when given a name, price, quantity, and category' do
      @category = Category.new(name: "Disco Balls")
      @product = Product.new(
        name: "Abba",
        price: 2,
        quantity: 56,
        category: @category
      )
      @product.save
      expect(@product).to be_valid
    end

    it 'requires a name' do
      @category = Category.new(name: "assorted cheeses")
      @product = Product.new(
        name: nil,
        price: 3000,
        quantity: 12,
        category: @category
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires a price' do
      @category = Category.new(name: "Farm Chic")
      @product = Product.new(
        name: 'Chicken Beak Belt',
        price: nil,
        quantity: 12,
        category: @category
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'requires a quantity' do
      @category = Category.new(name: "Loud Noises")
      @product = Product.new(
        name: 'World biggest pot of bubbling soup',
        price: 423,
        quantity: nil,
        category: @category
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'requires a category' do
      @category = Category.new(name: "Spells")
      @product = Product.new(
        name: 'Wingardium-Leviosa',
        price: 657,
        quantity: 12,
        category: nil
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
