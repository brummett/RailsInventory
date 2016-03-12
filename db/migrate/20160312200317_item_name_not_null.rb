class ItemNameNotNull < ActiveRecord::Migration
  def change
    change_column_null :items, :name, false
  end
end
