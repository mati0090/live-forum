class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id

  belongs_to :topic
end
