class Item < ApplicationRecord

  validates :name, presence: true
  validates :explain, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_from_id, presence: true
  validates :delivery_duration_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

end
