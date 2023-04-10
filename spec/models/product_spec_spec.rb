require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "saves a product with all 4 fields filled" do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Ranunculus", price_cents: 500000, quantity: 10, category: @category)
      expect(@product).to be_present
    end

    it "has a valid name" do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: nil, price_cents: 500000, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "has a valid price" do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Ranunculus", price_cents: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "has a valid quantity" do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Ranunculus", price_cents: 500000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "has a valid category" do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Ranunculus", price_cents: 500000, quantity: 10, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
