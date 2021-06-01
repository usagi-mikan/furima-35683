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
        @item.concept_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept category must be other than 1")
      end

      it "concept_status_idが「--」だと登録できない" do
        @item.concept_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept status must be other than 1")
      end

      it "delivery_charge_idが「--」だと登録できない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it "delivery_area_idが「--」だと登録できない" do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end

      it "delivery_day_idが「--」だと登録できない" do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは半角数字でないと登録できない" do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be half-width numbers")
      end

      it "priceは¥300~¥9,999,999の間でないと登録できない" do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

    end
  end
end
00