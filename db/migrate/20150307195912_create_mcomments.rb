class CreateMcomments < ActiveRecord::Migration
  def change
    create_table :mcomments do |t|
      t.text :body
      t.references :mpost, index: true

      t.timestamps
    end
  end
end
