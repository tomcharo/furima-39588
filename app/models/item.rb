class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :delivery_schedule

  belongs_to :user
  has_one_attached :image

  validates :image, :name, :info, :price, presence: true
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width numbers" }
  validates :price, numericality: { in: 300..9999999, message: "is out of setting range" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_schedule_id, numericality: { other_than: 1, message: "can't be blank" }
end
