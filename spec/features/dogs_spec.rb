require 'rails_helper'

feature "CRUD dogs" do
  scenario "After sign-up a user creates a dog" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Robert"
    fill_in "Last name", with: "Downey Jr."
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    fill_in "Zipcode", with: 94117
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_on "sign-up"
    fill_in "Name", with: "Iron Dog"
    fill_in "Breed", with: "Doberman"
    fill_in "Age", with: "2"
    fill_in "Size", with: "Large"
    fill_in "Gender", with: "Male"
    click_on "add-dog-action"

    expect(page).to have_content("Iron Dog")
    expect(page).to have_content("Edit Dog")
  end

  scenario "User can dog from their profile page" do
    user = User.create!(
      first_name: "Barbara",
      last_name: "Streisand",
      zipcode: 94117,
      email: "barbarastreisand@aol.com",
      password: "1234",
      password_confirmation: "1234"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "barbarastreisand@aol.com"
    fill_in "Password", with: "1234"
    click_on "signing-user-in-action"
    click_on "Barbara Streisand"
    click_on "Add Dog"

    fill_in "Name", with: "Diva"
    fill_in "Breed", with: "West Highland Terrier"
    fill_in "Age", with: "4"
    fill_in "Size", with: "Large"
    fill_in "Gender", with: "Female"
    click_on "add-dog-action"

  end
end
