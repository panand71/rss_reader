require 'rails_helper'
describe User do

  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "passwords"
    fill_in "Password confirmation", with: "passwords"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "when providing invalid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "pass"
    fill_in "Password confirmation", with: "words"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_content("Password is too short (minimum is 8 characters)")
  end

  before :each do
    User.create(email: 'user@example.com', password: 'passwords')
  end

  scenario "when providing valid login credentials" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "passwords"
    click_button "Log in"
    expect(page).to have_content("Invalid email or password")
  end

  scenario "when providing valid login credentials" do
    visit "/"
    click_link "Log Out"
    expect(page).to have_content("Signed out successfully")
  end  

end