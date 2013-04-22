require 'spec_helper'

describe MissivesController do
	describe "GET missive#show" do
		it "should respond with an HTTP 200 status code" do
			missive = FactoryGirl.create(:missive)
			get :show, id: missive
		  expect(response).to be_success
		  expect(response.status).to eq(200) 
		end

		it "should render show template" do
			missive = FactoryGirl.create(:missive)
			get :show, id: missive
		  expect(response).to render_template "show"
		end

		it "assigns @missive" do
		  missive = FactoryGirl.create(:missive)
		  get :show, id: missive
		  assigns(:missive).should eq(missive)
		end
	end

	describe "GET missives#index" do
	  it "responds successfully with an HTTP 200 status code" do
	  	get :index
	    expect(response).to be_success
	    expect(response.status).to eq(200)
	  end

	  it "renders the index template" do
	  	get :index
	  	expect(response).to render_template "index"
	  end

	  it "assigns @missives" do
	  	Missive.all.each { |missive| missive.delete }
	    missive1, missive2 = FactoryGirl.create(:missive), FactoryGirl.create(:missive)
	    get :index
	    assigns(:missives).should eq([missive1, missive2])
	  end
	end

	describe "GET missives#new" do
		before(:each) { get :new }
		it "responds successfully with an HTTP 200 status code" do
		  expect(response).to be_success
		  expect(response.status).to eq(200)
		end

		it "renders the new template" do
			expect(response).to render_template :new
		end
	end

	describe "GET missives#edit" do
		before(:each) do
		  missive = FactoryGirl.create(:missive)
		  user = FactoryGirl.create(:user)
		  session[:user_id] = user.id
		  get :edit, id: missive
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