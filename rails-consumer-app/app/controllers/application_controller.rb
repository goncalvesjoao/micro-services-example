class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :clear_current_user

  before_filter :setup_current_user

  before_filter :get_blog_cookie

  def current_user
    @current_user ||= User.where(id: session[:current_user] || 1).first
  end

  protected ############### PROTECTED ################

  def get_blog_cookie
    if session["blog_cookie"].blank?
      remote_call = Post.get_csrf_token

      current_user.update_attributes(
        blog_auth_token: remote_call.data,
        blog_cookie: remote_call.cookie.to_s)

      session["blog_cookie"] = current_user.blog_cookie
    end
  end

  def failed_flash_message(operation, operation_result)
    if operation_result.nil?
      message = 'Sorry, the server has returned an error!'
    elsif !operation_result
      message = "Failed to #{operation} object"
    end
  end

  private ################# PRIVATE ###################

  def clear_current_user
    User.clear_current_user
  end

  def setup_current_user
    User.current_user = current_user
  end

end
