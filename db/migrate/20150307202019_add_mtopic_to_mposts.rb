class AddMtopicToMposts < ActiveRecord::Migration
  def change
    add_column :mposts, :mtopic_id, :integer
    add_index :mposts, :mtopic_id
  end
end
