class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :concept_category
  belongs_to :concept_status
  belongs_to :delivery_area
  belongs_to :delivery_charge
  belongs_to :delivery_day

  #priceは¥300から¥9,999,999の範囲のみ許可する
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :title
    validates :catch_copy
    #priceは半角数字入力のみ許可する
    validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
    validates :concept_category_id
    validates :concept_status_id
    validates :delivery_area_id
    validates :delivery_charge_id
    validates :delivery_day_id
  end

end
