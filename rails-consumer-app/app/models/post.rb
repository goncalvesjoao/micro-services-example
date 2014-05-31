class Post < SmoothOperator::Rails

  self.endpoint = 'http://localhost:4040/'

  schema({
    body: :text,
    title: :string,
    publishing_date: :datetime
  })

  has_many :comments

  # belongs_to :user

  validates_length_of :title, minimum: 5

end
