class CreateDocentes < ActiveRecord::Migration[7.0]
  def change
    create_table :docentes do |t|
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.string :cedula

      t.timestamps
    end
  end
end
