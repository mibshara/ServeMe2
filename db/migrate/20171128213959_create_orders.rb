class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
