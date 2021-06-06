class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :telehome, :price, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, telephone: telephome, purchase_id: purchase.id)
  end

end