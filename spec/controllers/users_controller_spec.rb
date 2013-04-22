require 'spec_helper'

describe UsersController do
	describe "GET user#show" do
		it "should respond with an HTTP 200 status code" do
			user = FactoryGirl.create(:user)
			get :show, id: user
		  expect(response).to be_success
		  expect(response.status).to eq(200) 
		end

		it "should render show template" do
			user = FactoryGirl.create(:user)
			get :show, id: user
		  expect(response).to render_template "show"
		end

		it "assigns @user" do
		  user = FactoryGirl.create(:user)
		  get :show, id: user
		  assigns(:user).should eq(user)
		end
	end

	describe "GET users#index" do
	  it "responds successfully with an HTTP 200 status code" do
	  	get :index
	    expect(response).to be_success
	    expect(response.status).to eq(200)
	  end

	  it "renders the index template" do
	  	get :index
	  	expect(response).to render_template "index"
	  end

	  it "assigns @users" do
	  	User.all.each { |user| user.delete }
	    user1, user2 = FactoryGirl.create(:user), FactoryGirl.create(:user)
	    get :index
	    assigns(:users).should eq([user1, user2])
	  end
	end

	describe "GET users#new" do
		before(:each) { get :new }
		it "responds successfully with an HTTP 200 status code" do
		  expect(response).to be_success
		  expect(response.status).to eq(200)
		end

		it "renders the new template" do
			expect(response).to render_template :new
		end
	end

	describe "GET users#edit" do
		before(:each) do
		  user = FactoryGirl.create(:user)
		  get :edit, id: user
		end

		it "responds successfully with an HTTP 200 status code" do
		  expect(response).to be_success
		  expect(response.status).to eq(200)
		end

		it "renders the edit template" do
			expect(response).to render_template :edit
		end
	end
end
