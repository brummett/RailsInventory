class DefaultItemCostPrice < ActiveRecord::Migration
  def change
    change_column_default :items, :cost_cents, 0
    change_column_default :items, :price_cents, 0
  end
end
