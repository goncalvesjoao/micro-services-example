class PostsController < ApplicationController

  def index
    remote_call = Post.find(:all, page: params[:page])

    @service_down = remote_call.error?

    @posts = remote_call.data
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    save_result = @post.save

    if save_result
      redirect_to(posts_path)
    else
      set_flash_message(:save, save_result, true)
      render "new"
    end
  end

  def edit
    remote_call = Post.find(params[:id])

    @post = remote_call.data

    redirect_to(posts_path, error: 'Sorry, the server has returned an error!') if remote_call.error?
  end

  def update
    @post = Post.new(params[:post])

    save_result = @post.save

    if save_result
      redirect_to(posts_path)
    else
      set_flash_message(:save, save_result, true)
      render "edit"
    end
  end

  def destroy
    @post = Post.new(id: params[:id])

    set_flash_message(:destroy, @post.destroy)

    redirect_to(posts_path)
  end

  protected ################### PROTECTED ###############

  def layout_according_to(save_result)
    save_result.nil? ? "service_down" : nil
  end

end