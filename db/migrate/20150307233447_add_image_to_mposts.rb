class AddImageToMposts < ActiveRecord::Migration
  def change
    add_column :mposts, :image, :string
  end
end