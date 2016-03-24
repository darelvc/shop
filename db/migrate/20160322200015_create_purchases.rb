class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
  end
end
