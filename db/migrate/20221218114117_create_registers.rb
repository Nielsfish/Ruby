class CreateRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :registers do |t|
      t.integer :register_id
      t.references :employee, null: false, foreign_key: true
      t.references :gate, null: false, foreign_key: true
      t.date :date_in
      t.time :time_in
      t.date :date_out
      t.time :time_out

      t.timestamps
    end
  end
end
