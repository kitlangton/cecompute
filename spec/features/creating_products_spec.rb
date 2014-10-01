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

    fill_in "Name", with: "Basic Tube"
    fill_in "Base cost", with: "50.00"
    fill_in "Duplicate cost", with: "20.00"

    click_button "Create Product"

    expect(page).to have_content "Basic Tube"
    expect(page).to have_content "$50.00"
    expect(page).to have_content "$20.00"

  end

# Tests Validation

  scenario "Creating a product without a name" do
    click_link "Create Product"

    fill_in "Name", with: ""
    fill_in "Base cost", with: "50.00"
    fill_in "Duplicate cost", with: "20.00"

    click_button "Create Product"

    expect(page).to have_content "can't be blank"
  end

  scenario "Creating a product without a name" do
    click_link "Create Product"

    fill_in "Name", with: "Basic Tube"
    fill_in "Base cost", with: ""
    fill_in "Duplicate cost", with: "20.00"

    click_button "Create Product"

    expect(page).to have_content "can't be blank"
  end

  scenario "Creating a product without a name" do
    click_link "Create Product"

    fill_in "Name", with: "Basic Tube"
    fill_in "Base cost", with: "50.00"
    fill_in "Duplicate cost", with: ""

    click_button "Create Product"

    expect(page).to have_content "can't be blank"
  end
end
