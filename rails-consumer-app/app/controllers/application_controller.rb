class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected ################# PROTECTED ################

  def set_flash_message(operation, operation_result, now = false)
    if operation_result.nil?
      message = 'Sorry, the server has returned an error!'
    elsif !operation_result
      message = "Failed to #{operation} object"
    end

    if now
      flash.now[:error] = message
    else
      flash[:error] = message
    end
  end

end
