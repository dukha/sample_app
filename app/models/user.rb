# == Schema Information
# Schema version: 20101004062826
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                  :length   => { :maximum => 50 }

  validates :email, :presence => true,
                   :format=>{:with => email_regex},
                   :uniqueness => {:case_sensitive => false}
                   
   ## code to catch a simultaneous submission giving unique violation (in app controller??)                
   # rescue ActiveRecord::StatementInvalid
    ## Handle duplicate email addresses gracefully by redirecting.
    #  #flash[:error] = "Invalid unique email"
    #redirect_to home_url
  #rescue ActionController::InvalidAuthenticityToken
    ## Experience has shown that the vast majority of these are bots
    ## trying to spam the system, so catch & log the exception.
    #warning = "ActionController::InvalidAuthenticityToken: #{params.inspect}"
    #logger.warn warning
    #redirect_to home_url                 

end
