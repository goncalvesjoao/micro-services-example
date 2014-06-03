class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :blog_cookie
      t.string :blog_auth_token

      t.timestamps
    end
  end
end
