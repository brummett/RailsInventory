class CustomerFirstNameNotNull < ActiveRecord::Migration
  def change
    change_column_null :customers, :first_name, true
  end
end
