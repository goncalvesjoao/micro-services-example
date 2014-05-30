class Post < SmoothOperator::Rails

  schema({
    body: :text,
    title: :string,
    publishing_date: :datetime
  })

  has_many :comments

  # belongs_to :user

end
