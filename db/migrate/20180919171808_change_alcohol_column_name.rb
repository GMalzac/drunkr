class ChangeAlcoholColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :drinks, :alcohol, :alcohol_unit
  end
end
