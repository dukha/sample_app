require 'spec_helper'

describe UsersController do
  render_views
  describe "GET 'show'" do 
    before(:each) do
        @user = Factory(:user)
    end
    it "should be successful" do
      # could also use get 'show' but use symbols better for REST tests
      # could also use :id=>@user.id but rails odes this for us.
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      # RSpec (via the underlying Test::Unit library). 
      # The assigns method takes in a symbol argument and returns the value of the corresponding instance variable in the controller action
      assigns(:user).should == @user
    end
    # An alternative to the above is stubbing which doesn't access db for controller test
    #before(:each)
      #@user = Factory(:user)
      #User.stub!(:find, @user.id).and_return(@user)
    #end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end

  end #GET show


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
     end # successful
  
    it "should have the right title" do
        get 'new'
        response.should have_selector("title", :content => "Sign up")
    end #right title
  end # GET new  

end #UsersController
