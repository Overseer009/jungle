
require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do 
  
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "see all product details" do
    visit root_path

    find("header a").click
    sleep 5
    save_screenshot
    expect(page).to have_content 'Apparel'
  end
end