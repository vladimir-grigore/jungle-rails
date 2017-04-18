require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

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

  scenario "They see the product details" do
    visit root_path
    page.first("article.product a").click
    expect(page).to have_css 'section.products-show', count: 1
  end

  scenario "They are not on the home page anymore" do
    visit root_path
    page.first("article.product a").click
    expect(page).to_not have_css 'section.products-index'
  end

end
