require 'rails_helper'

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart updated" do
    visit root_path
    expect(page.find("ul.navbar-right")).to have_text "My Cart (0)"
    page.first("article.product").find_link("Add").click
    expect(page.find("ul.navbar-right")).to have_text "My Cart (1)"
    expect(page.find("ul.navbar-right")).to_not have_text "My Cart (0)"
  end

end
