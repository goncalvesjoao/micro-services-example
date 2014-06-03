class SmoothResource < SmoothOperator::Rails

  def self.before_request(http_verb, relative_path, data, options)
    options[:headers] ||= {}

    if current_user
      options[:headers].merge!({
        cookie: current_user.blog_cookie,
        "authenticity_token" => current_user.blog_auth_token
      })
    end

    [http_verb, relative_path, data, options]
  end

  protected ############## PROTECTED #################

  def self.current_user
    User.current_user
  end

end
