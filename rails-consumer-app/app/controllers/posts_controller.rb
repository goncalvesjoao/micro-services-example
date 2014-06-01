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
      render "new", layout: layout_according_to(save_result)
    end
  end

  protected ################### PROTECTED ###############

  def layout_according_to(save_result)
    save_result.nil? ? "service_down" : nil
  end

end