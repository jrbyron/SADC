class CreateMvotes < ActiveRecord::Migration
  def change
    create_table :mvotes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :mpost, index: true

      t.timestamps
    end
  end
end