
require 'rails_helper'

RSpec.feature "Visitor adds an item to the cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Electronics'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click to add an item to the cart" do
  
  visit root_path

  first('article.product').find_link('Add').click # See https://github.com/jensen/rspec-notes/

  expect(page).to have_css 'article.product', count: 10

  end
end
