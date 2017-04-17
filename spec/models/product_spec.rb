require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: "Test") }

  describe 'Validations' do
    it 'should save if all required fields are present' do
      @product = Product.create(
        name: "Test_product",
        price: 10,
        quantity: 2,
        category_id: category.id
      )
      expect(@product).to be_persisted
    end

    it 'should not save without a name' do
      @product = Product.create(
        name: nil,
        price: 10,
        quantity: 2,
        category_id: category.id
      )
      expect(@product).to_not be_persisted
      expect(@product.errors.full_messages[0]).to match "Name can't be blank"
    end

    it 'should not save without a price' do
      @product = Product.create(
        name: "Test",
        price: nil,
        quantity: 2,
        category_id: category.id
      )
      expect(@product).to_not be_persisted
      expect(@product.errors.full_messages).to match([
        "Price cents is not a number", 
        "Price is not a number", 
        "Price can't be blank"])
    end

    it 'should not save without a quantity' do
      @product = Product.create(
        name: "Test",
        price: 10,
        quantity: nil,
        category_id: category.id
      )
      expect(@product).to_not be_persisted
      expect(@product.errors.full_messages[0]).to match "Quantity can't be blank"
    end
    
    it 'should not save without a category' do
      @product = Product.create(
        name: "Test",
        price: 10,
        quantity: 2,
        category_id: nil
      )
      expect(@product).to_not be_persisted
      expect(@product.errors.full_messages[0]).to match "Category can't be blank"
    end

  end
end
