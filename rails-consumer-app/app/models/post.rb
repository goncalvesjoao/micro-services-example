class Post < SmoothOperator::Rails

  self.rails_serialization = true # this will generate comments_attributes = { '1' => { id: 1, body: 'comment body' } }

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
