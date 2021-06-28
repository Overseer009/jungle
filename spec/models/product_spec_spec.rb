require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before (:each) do
      @category = Category.new name: "New Stuff"
      @new_product = Product.new(name: "thing", price_cents: 500, quantity: 1, category: @category)
    end

    it "Successfully saved with all fields entered" do
      @new_product.save
      expect(@new_product).to be_valid
    end

    it "is valid with name" do
      @new_product[:name] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Name can't be blank")
    end

    it "is valid with price" do
      @new_product[:price_cents] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Price can't be blank")
    end

    it "is valid with quantity" do
      @new_product[:quantity] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is valid with category" do
      @new_product.category = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
