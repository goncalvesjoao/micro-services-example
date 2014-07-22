class SmoothResource < SmoothOperator::Rails

  options headers: :custom_headers

  def self.custom_headers
    {
      cookie: current_user.blog_cookie,
      "X_CSRF_TOKEN" => current_user.blog_auth_token
    }
  end

  # IF you don't want to add the user_id on the controller,
  # you can always added it on every :put or :post requests

  # def self.before_request(http_verb, relative_path, data, options)
  #   if [:put, :patch, :post].include?(http_verb)
  #     data[resource_name] ||= {}

  #     if current_user
  #       data[resource_name][:user_id] = current_user.id
  #     end
  #   end

  #   [http_verb, relative_path, data, options]
  # end

  protected ############## PROTECTED #################

  def self.current_user
    User.current_user
  end

end
