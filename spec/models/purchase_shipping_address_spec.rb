require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:purchase_shipping_address,user_id: user.id,item_id: item.id)
    sleep(1)
  end

  describe "購入情報登録" do
    context '購入登録できるとき' do
      it 'postal_code,prefecture_id,city,house_number,building_name,telephone,トークンが存在すれば登録できること' do
        expect(@order).to be_valid
      end

      it 'building_nameが空でも登録ができる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end

    end

    context '購入登録できないとき' do
      it 'postal_codeが空だと登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeの保存にはハイフンがないと登録できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_codeの保存には全角数字では登録できない' do
        @order.postal_code = '１１１-１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_codeの保存には「半角数字3桁-半角数字4桁（123-4567）」の形式でないと登録できない' do
        @order.postal_code = '123-456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      
      it 'prefecture_idが「--」だと登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it 'cityが空だと登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephoneが空だと登録できない' do
        @order.telephone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneは10桁か11桁の数字でないと登録できない' do
        @order.telephone = '123456789012345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is too short")
      end

      it 'telephoneは全角数字では登録できない' do
        @order.telephone = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone should be half-width numbers")
      end

      it 'telephoneは半角数字のみでないと登録できない' do
        @order.telephone = 'a1234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone should be half-width numbers")
      end

      # it 'クレジットカードのトークンが空だと登録できない' do
      # end

      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
