class PostsController < SmoothController

  # TAKE A LOOK AT SmoothController

  def index
    remote_call = Post.find(:all, page: params[:page])

    @service_down = remote_call.error?

    @posts = remote_call.data
  end

  def new
    @post = Post.new
  end

  def show
    find_smooth_resource
  end

  def create
    save_smooth_resource('new')
  end

  def edit
    find_smooth_resource
  end

  def update
    save_smooth_resource('edit')
  end

  def destroy
    @post = Post.new(id: params[:id])

    set_flash_message(:destroy, @post.destroy)

    redirect_to(posts_path)
  end

end
