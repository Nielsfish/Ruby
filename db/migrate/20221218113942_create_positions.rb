class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.integer :position_id
      t.string :position_name
      t.integer :salary

      t.timestamps
    end
  end
end
