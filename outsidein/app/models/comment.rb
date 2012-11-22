class Comment < ActiveRecord::Base
  attr_accessible :body, :author_name
  
  belongs_to :article
end
