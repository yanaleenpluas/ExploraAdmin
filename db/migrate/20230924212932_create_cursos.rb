class CreateCursos < ActiveRecord::Migration[7.0]
  def change
    create_table :cursos do |t|
      t.references :periodo, null: false, foreign_key: true
      t.references :docente, foreign_key: true
      t.string :tipo_institucion
      t.string :jornada
      t.string :paralelo
      t.string :portada
      t.string :color
      t.string :materia

      t.timestamps
    end
  end
end
