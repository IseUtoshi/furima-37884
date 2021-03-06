class PurchaseDeliveryAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postcode, :building, :house_number, :municipality, :prefecture_id,
                :telephone_number

  validates :token, presence: { message: 'に誤りがあります' }
  validates :user_id, presence: { message: 'が存在しません' }
  validates :item_id, presence: { message: 'が存在しません' }
  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフンを含めてください' }
    validates :house_number
    validates :municipality
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は10~11桁の半角数字のみで記載してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postcode: postcode, building: building, house_number: house_number, municipality: municipality,
                           prefecture_id: prefecture_id, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
