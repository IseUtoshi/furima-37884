class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :postcode,         null: false
      t.string     :building
      t.string     :house_number,     null: false
      t.string     :municipality,     null: false
      t.integer    :prefecture_id,    null: false
      t.string     :telephone_number, null: false
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
