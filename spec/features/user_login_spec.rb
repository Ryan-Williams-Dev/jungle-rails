require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name:            "rspec",
      last_name:             "test",
      email:                 "spec@spec.com",
      password:              "spec",
      password_confirmation: "spec"
    )
  end

  scenario "They log in" do
    visit login_path

    fill_in 'Email', with: 'spec@spec.com'
    fill_in 'Password', with: 'spec'
    click_on("Log in")

    save_screenshot

    expect(page).to have_text "rspec", count: 1


  end
  
end
