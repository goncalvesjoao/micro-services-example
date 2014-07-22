class Post < ActiveRecord::Base

  has_many :comments

  accepts_nested_attributes_for :comments, allow_destroy: true

  validates_presence_of :body, :user_id

end
