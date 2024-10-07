class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :how_long

  belongs_to :user
  has_one_attached :image

  validates :name, :explanation, :user,
            presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :how_long_id, numericality: { other_than: 1 },
                                                                                    message: "can't be blank",
                                                                                    presence: true
end
