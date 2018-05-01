require 'rails_helper'

RSpec.describe Product, type: :model do

# describes validation subcategories of name, price, quantity, and category
  describe 'Validations' do
    it 'saves given the validation of present name/price/quantity/category' do
      @category = Category.new
      @product = Product.new(:name => "Hipster Glasses",
                             :price => 20,
                             :quantity => 10,
                             :category => @category)
      @product.save!
      expect(@product.id).to be_present
    end


    # validates :name, presence: true
      it 'validates the present name' do
        @category = Category.new
        @product = Product.new(:name => nil,
                               :price => 20,
                               :quantity => 10,
                               :category => @category)
        expect(@product.valid?).not_to be_present
      end


    # validates :price, presence: true
      it 'validates the present price' do
        @category = Category.new
        @product = Product.new(:name => "Hipster Glasses",
                               :price => "",
                               :quantity => 10,
                               :category => @category)
        expect(@product.valid?).not_to be_present
      end


    # validates :quantity, presence: true
      it 'validates the present quantity' do
        @category = Category.new
        @product = Product.new(:name => "Hipster Glasses",
                               :price => 20,
                               :quantity => nil,
                               :category => @category)
        expect(@product.valid?).not_to be_present
      end


    # validates :category, presence: true
      it 'validates the present category' do
        @category = Category.new
        @product = Product.new(:name => "Hipster Glasses",
                               :price => 20,
                               :quantity => 10,
                               :category => nil)
        expect(@product.valid?).not_to be_present
      end
  end
end
