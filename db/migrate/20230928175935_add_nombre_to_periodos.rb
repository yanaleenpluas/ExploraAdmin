class AddNombreToPeriodos < ActiveRecord::Migration[7.0]
  def change
    add_column :periodos, :nombre, :string
  end
end
