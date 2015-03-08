class AddUserToMcomments < ActiveRecord::Migration
  def change
    add_column :mcomments, :user_id, :integer
    add_index :mcomments, :user_id
  end
end
