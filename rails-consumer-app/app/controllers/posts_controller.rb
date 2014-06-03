class PostsController < ApplicationController

  def index
    remote_call = Post.find(:all, page: params[:page])

    @service_down = remote_call.error?

    @posts = remote_call.data
  end

  def new
    @post = Post.new
  end

  def show
    find_post
  end

  def create
    create_or_update_post('new')
  end

  def edit
    find_post
  end

  def update
    create_or_update_post('edit')
  end

  def destroy
    @post = Post.new(id: params[:id])

    destroy_result = @post.destroy

    unless destroy_result
      flash[:error] = failed_flash_message(:destroy, destroy_result)
    end

    redirect_to(posts_path)
  end

  protected ################# PROTECTED ################

  def find_post
    remote_call = Post.find(params[:id])

    @post = remote_call.data

    if remote_call.error?
      redirect_to(posts_path, flash: { error: 'Sorry, the server has returned an error!' })
    end
  end

  def create_or_update_post(error_view_name)
    @post = Post.new(params[:post])

    @post.user_id = current_user.id

    save_result = @post.save

    if save_result
      redirect_to(posts_path)
    else
      flash.now[:error] = failed_flash_message(:save, save_result)

      render error_view_name
    end
  end

end
