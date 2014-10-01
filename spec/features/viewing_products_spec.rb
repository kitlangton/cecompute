require 'rails_helper'

feature "Viewing Products" do

  let (:user) { FactoryGirl.create(:user) }
  let (:product) { FactoryGirl.create(:product) }

  before do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    Product.new(
      name: product.name,
      base_cost: product.base_cost,
      duplicate_cost: product.duplicate_cost,
    ).save
  end

  scenario "the user sees products after logging in" do
    visit root_path

    expect(page).to have_content product.name

  end

end
