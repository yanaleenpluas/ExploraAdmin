class AddCanvasTermIdToPeriodos < ActiveRecord::Migration[7.0]
  def change
    add_column :periodos, :canvas_term_id, :integer
  end
end
