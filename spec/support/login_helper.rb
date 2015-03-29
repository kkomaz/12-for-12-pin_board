module LoginHelper
  def login_valid
    visit '/'
    click_link('Sign In')
    expect(current_path).to eq('login')
    fill_in(:email, :with => 'lol@lol.com')
    fill_in(:password, :with => 'password')
    click_button('Log in')
    expect(current_path).to eq ('/')
    expect(page).to have_content('Signed in successfully')
  end
end