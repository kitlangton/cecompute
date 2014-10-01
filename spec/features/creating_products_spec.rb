require 'rails_helper'

feature "Creating products" do

  let (:admin) { FactoryGirl.create(:admin) }

  before do
    visit new_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end

  scenario "Creating a product" do

    click_link "Create Product"

    
  end
end
