require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品情報新規登録" do
    context '新規登録できるとき' do
      it 'image,title,catch_copy,concept_category_id,concept_status_id,delivery_charge_id,delivery_area_id,delivery_day_id,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")  
      end
      
      it "titleが空だと登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it "catch_copyが空だと登録できない" do
        @item.catch_copy = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch copy can't be blank")
      end

      it "concept_category_idが「--」だと登録できない" do
        @item.concept_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept category must be other than 1")
      end

      it "concept_status_idが「--」だと登録できない" do
        @item.concept_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept status must be other than 1")
      end

      it "delivery_charge_idが「--」だと登録できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it "delivery_area_idが「--」だと登録できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end

      it "delivery_day_idが「--」だと登録できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは全角数字では登録できない" do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be half-width numbers")
      end

      it "priceは半角英数混合では登録できない" do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be half-width numbers")
      end

      it "priceは¥300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceは¥10,000,000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it "priceは半角英数混合では登録できない" do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end