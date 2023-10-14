require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品出品できる場合" do
      it "全て入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品出品できない場合" do
      it "image:空" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "name:空" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "info:空" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "category_id:空" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_id:1(category:---)" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_id:空" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_id:1(condition:---)" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_fee_status_id:空" do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it "shipping_fee_status_id:1(shipping_fee_status:---)" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it "prefecture_id:空" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_id:1(prefecture:---)" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_schedule_id:空" do
        @item.delivery_schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
      end
      it "delivery_schedule_id:1(delivery_schedule:---)" do
        @item.delivery_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
      end
      it "price:空" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price:300より小さい" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "price:9999999より大きい" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "price:数値以外を含む" do
        @item.price = "1,000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers")
      end
      it "price:全角を含む" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers")
      end
    end
  end
end
