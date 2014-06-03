PadrinoBlogService::App.controllers :posts do

  get :index do
    @posts = Post.page(params[:page]).per(5)

    json({ posts: @posts, current_page: @posts.current_page, total_pages: @posts.total_pages, limit_value: @posts.limit_value })
  end

  get ':id' do
    @post = Post.find(params[:id])

    @post.to_json(methods: [:comments])
  end

  post '' do
    @post = Post.new(params[:post])

    status(@post.save ? 200 : 422)

    @post.to_json(methods: [:errors, :comments])
  end

  put ':id' do
    @post = Post.find(params[:id])

    status(@post.update_attributes(params[:post]) ? 200 : 422)

    @post.to_json(methods: [:errors, :comments])
  end

  delete ':id' do
    @post = Post.find(params[:id])

    status(@post.destroy ? 204 : 422)

    @post.to_json(methods: [:errors])
  end

end
