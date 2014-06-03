class Comment < ActiveRecord::Base

  validates_presence_of :body

  def serializable_hash(options = {})
    options ||= {}
    options[:methods] ||= []

    unless options[:methods].include?(:errors)
      options[:methods] << :errors
    end

    options[:methods] << :_destroy

    super(options)
  end

end
