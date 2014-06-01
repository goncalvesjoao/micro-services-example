PadrinoBlogService::App.controllers :posts do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do
    @posts = Post.page(params[:page]).per(5)

    json({ posts: @posts, current_page: @posts.current_page, total_pages: @posts.total_pages, limit_value: @posts.limit_value })
  end

  get ':id' do
    @post = Post.find(params[:id])

    json @post
  end

  post '' do
    @post = Post.new(params[:post])

    status(@post.save ? 200 : 422)

    json({ errors: @post.errors })
  end

  put ':id' do
    @post = Post.find(params[:id])

    status(@post.update_attributes(params[:post]) ? 200 : 422)

    json({ errors: @post.errors })
  end

  delete ':id' do
    @post = Post.find(params[:id])

    status(@post.destroy ? 200 : 422)

    json({ errors: @post.errors })
  end

end
