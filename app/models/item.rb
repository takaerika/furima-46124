class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id,
            presence: true,
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
