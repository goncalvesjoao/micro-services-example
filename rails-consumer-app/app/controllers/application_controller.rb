class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected ################ PROTECTED ##################

  def resource_name
    @resource_name ||= controller_name.singularize
  end

  def resource_class
    @resource_class ||= "#{resource_name.camelize}".constantize
  end

  def set_resource(object)
    instance_variable_set("@#{resource_name}", object)
  end

  def get_resource
    instance_variable_get("@#{resource_name}")
  end

end
