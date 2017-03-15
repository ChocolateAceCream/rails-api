class CreateDhts < ActiveRecord::Migration[5.0]
  def change
    create_table :dhts do |t|
      t.string :name
      t.float :temperature
      t.float :humidity

      t.timestamps
    end
  end
end
