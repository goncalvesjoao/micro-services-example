class User < ActiveRecord::Base

  def self.clear_current_user
    Thread.current[:current_user] = nil
  end

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(user)
    Thread.current[:current_user] = user
  end

end
