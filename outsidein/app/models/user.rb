class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  validates_confirmation_of :password, :message => "Passwords should match", :if => :password
  validates_presence_of :username, :message => "Username cannot be empty"

end
