class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :telephone
    #postal_codeは半角数字入力のみと「3桁-4桁」のみ許可する
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #telephoneは半角数字入力のみ許可する
    validates :telephone, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
    validates :prefecture_id
  end

end
