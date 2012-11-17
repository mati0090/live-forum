class Topic < ActiveRecord::Base
  attr_accessible :body, :title

  has_many :posts
end
