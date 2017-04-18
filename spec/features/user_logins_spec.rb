require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do

  before :each do
    @user = User.create(
        first_name: "Bender",
        last_name: "the Robot",
        email: "bender@email.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
  end

  scenario "They land on the home page" do
    visit login_path
    fill_in "email", with: "bender@email.com"
    fill_in "password", with: "test1234"
    click_on "Submit"
    expect(page).to have_css 'section.products-index'
  end

  scenario "They cannot log in with invalid username or password" do
    visit login_path
    fill_in "email", with: "bend@email.com"
    fill_in "password", with: "test1"
    click_on "Submit"
    expect(page).to_not have_css 'section.products-index'
  end

end
