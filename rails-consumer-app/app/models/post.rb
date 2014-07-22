class Post < SmoothResource

  options rails_serialization: true, # this will generate comments_attributes = { '1' => { id: 1, body: 'comment body' } }
          server_name: "padrino-blog",
          endpoint: 'http://localhost:4040/'

  schema \
    body: :text,
    title: :string,
    publishing_date: :datetime

  has_many :comments

  validates_length_of :title, minimum: 5

  def self.get_csrf_token
    Post.get('csrf_token', nil, { resources_name: '' })
  end

end
