class CreateMtopics < ActiveRecord::Migration
  def change
    create_table :mtopics do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
