class AddRankToMposts < ActiveRecord::Migration
  def change
    add_column :mposts, :rank, :float
  end
end
