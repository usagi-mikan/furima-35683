class ItemShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :telephone, :price, :user_id
end