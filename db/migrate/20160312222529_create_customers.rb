class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.boolean :is_taxable
      t.string :phone_number
      t.string :alternate_phone_number
      t.string :email
      t.string :notes

      t.timestamps null: false
    end
  end
end
