class CreateJoinTableEstudiantesCursos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :estudiantes, :cursos do |t|
      # t.index [:estudiante_id, :curso_id]
      # t.index [:curso_id, :estudiante_id]
    end
  end
end
