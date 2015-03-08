class CreateMposts < ActiveRecord::Migration
  def change
    create_table :mposts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
