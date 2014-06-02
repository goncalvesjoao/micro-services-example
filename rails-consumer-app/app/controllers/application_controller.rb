class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private ############### PRIVATE ################

  def set_flash_message_now(operation, operation_result, now = false)
    set_flash_message(operation, operation_result, true)
  end

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
