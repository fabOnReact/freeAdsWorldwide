require 'rails_helper'

feature 'Sign in', :devise do

	def login_action
		#binding.pry
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Dashboard/)
	end

	scenario 'user cannot sign in if not registered' do
		signin('test@example.com', 'please123')
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'user can sign in with valid credentails' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Signed in successfully/)
	end

	scenario 'user cannot sign in with wrong email' do
		user = FactoryGirl.create(:user)
		signin('invalidemail@gmail.com', user.password)
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'user cannot sign in with wrong password' do
		user = FactoryGirl.create(:user)
		signin(user.email, 'invalidpass')
		expect(page).to have_content(/Invalid Email or password/)
	end

	scenario 'after signin user is redirected to application page' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		expect(page).to have_content(/Dashboard/)
	end

	scenario 'already signed in user is redirected to application page' do
		login_action
		visit('/')
		expect{
			visit('/')
			page.has_text?'RoutingError'
			}.to raise_error(ActionController::RoutingError)
		#expect(page).to have_content(/this is the Dashboard afdsfsda /)
	end

	scenario 'signed in user tries to sign in again and receive an error' do
		login_action
		visit('/')
		click_link('Login')
		expect(page).to have_content(/You are already signed in/)
	end

end