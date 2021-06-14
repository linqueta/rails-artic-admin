describe "the signin process", type: :feature do
  before :each do
    User.create!(email: 'user@example.com', password: 'password')
  end

  after :each do
    User.destroy_all
  end

  it "signs me in" do
    visit '/login'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Entrar'
    expect(page).to have_content 'Signed in successfully.'
  end
end