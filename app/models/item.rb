class Item < ApplicationRecord

  validates :name, presence: true
  validates :explain, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_from_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_duration_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_from
  belongs_to :delivery_duration
end
