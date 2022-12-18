class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :manager_id

      t.timestamps
    end
  end
end
