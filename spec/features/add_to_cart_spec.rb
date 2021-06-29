require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
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
  
  scenario "my cart +1" do
    visit root_path

    find("button.btn").click
    sleep 5
    save_screenshot
    expect(page).to have_content('My Cart (1)')
  end
  
end
