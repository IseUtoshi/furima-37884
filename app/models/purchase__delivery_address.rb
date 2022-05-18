class PurchaseDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :building, :house_number, :municipality, :prefecture, :telephone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを含めてください"}
    validates :house_number
    validates :municipality
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "は10~11桁の数字のみで記載してください"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end