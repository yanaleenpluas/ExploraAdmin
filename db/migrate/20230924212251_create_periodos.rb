class CreatePeriodos < ActiveRecord::Migration[7.0]
  def change
    create_table :periodos do |t|
      t.datetime :fecha_inicio, null: false
      t.datetime :fecha_fin, null: false

      t.timestamps
    end
  end
end
