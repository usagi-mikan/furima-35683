class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :price, :purchase_id, :user_id, :item_id, :token

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :house_number
    validates :telephone
    validates :token
    #postal_codeは半角数字入力のみと「3桁-4桁」のみ許可する
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    #telephoneは半角数字入力のみ許可する
    validates :telephone, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
    #telephoneは10桁か11桁の半角数字入力のみ許可する
    validates :telephone, format:{ with: /\A\d{10,11}\z/, message: 'number is too short' }
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
    validates :prefecture_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, purchase_id: purchase.id)
  end

end