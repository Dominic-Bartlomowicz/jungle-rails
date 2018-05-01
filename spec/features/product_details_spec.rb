
require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product detail page", type: :feature, js: true do

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

  scenario "They click on a product from the home page" do
   
  visit root_path

  first('article.product').find_link('Details').click # See https://github.com/jensen/rspec-notes/

  expect(page).to have_css 'article.product-detail'

  end
end


