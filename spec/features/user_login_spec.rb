require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create! first_name: 'Connie', last_name: 'Ho', email: 'example@domain.com', password: 'password', password_confirmation: 'password'
  end

  scenario "They see they are logged in" do
    # ACT
    visit root_path
    find('nav').click_on 'Login'
    fill_in 'Email', with: 'example@domain.com'
    fill_in 'Password', with: 'password'
    page.click_on 'Submit'
    # DEBUG / VERIFY
    expect(page).to have_css("nav", text: "Signed in as: example@domain.com")
    save_screenshot
  end

end