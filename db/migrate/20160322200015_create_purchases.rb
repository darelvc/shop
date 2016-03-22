class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.references :user, index: true, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps null: false
    end
  end
end
