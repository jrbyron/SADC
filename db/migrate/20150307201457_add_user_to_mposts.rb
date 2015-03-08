class AddUserToMposts < ActiveRecord::Migration
  def change
    add_column :mposts, :user_id, :integer
      add_index :mposts, :user_id
  end
end
