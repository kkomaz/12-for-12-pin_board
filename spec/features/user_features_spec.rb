require_relative '../spec_helper.rb'

describe 'user login', :type => :feature do
  it 'successfully logs in' do 
    visit '/'
    click_link('Sign In')
    expect(current_path).to eq('/auth/login')
    fill_in('Email', :with => @crookshanks.email)
    fill_in('Password', :with => @crookshanks.password)
    click_button('Log in')
    expect(current_path).to eq ('/')
    save_and_open_page
    expect(page).to have_content('Signed in successfully.')
  end

  it 'fails to log in' do
    visit '/'
    click_link('Sign In')
    expect(current_path).to eq('/auth/login')
    fill_in('Email', :with => "Not")
    fill_in('Password', :with => "signed up")
    click_button('Log in')
    expect(current_path).to eq('/login')
    expect(page).to have_content('Sign in')
  end

end

