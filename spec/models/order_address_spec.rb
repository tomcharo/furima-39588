require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    sleep 0.1
    @order_address = FactoryBot.build(:order_address, user_id: item.user_id, item_id: item.id)
  end

  describe "商品購入" do
    context "商品購入できる場合" do
      it "全て入力されていれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "building:空でも購入できる" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end
    context "商品購入できない場合" do
      it "token:空" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_code:空" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_code:半角ハイフンを含む正しい形式でない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "prefecture_id:空" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_id:1(prefecture:---)" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "city:空" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "address:空" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_number:空" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_number:半角数値でない" do
        @order_address.phone_number = "000-1111-2222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width numbers")
      end
      it "phone_number:桁数が正しくない" do
        @order_address.phone_number = "000111222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is out of setting range")
      end
      it "user:紐付いていない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item:紐付いていない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end