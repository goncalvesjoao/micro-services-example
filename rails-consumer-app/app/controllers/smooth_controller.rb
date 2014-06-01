class SmoothController < ApplicationController

  # CHECK ApplicationController ALSO

  protected ################# PROTECTED ################

  def find_smooth_resource
    remote_call = resource_class.find(params[:id])

    set_resource remote_call.data

    if remote_call.error?
      redirect_to(posts_path, flash: { error: 'Sorry, the server has returned an error!' })
    end
  end

  def save_smooth_resource(error_view_name)
    set_resource resource_class.new(params[:post])

    save_result = get_resource.save

    if save_result
      redirect_to(posts_path)
    else
      set_flash_message(:save, save_result, true)
      render error_view_name
    end
  end

  private ############### PRIVATE ################

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
