require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'userが紐付いていないと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_cordが空だと購入できない' do
        @order.post_cord = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cordが「3桁-4桁」以外だと購入できない' do
        @order.post_cord = '12-34567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post cord is invalid')
      end
      it 'post_cordが半角文字列でないと購入できない' do
        @order.post_cord = '１２３−４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post cord is invalid')
      end
      it 'cityが空だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numが空だと購入できない' do
        @order.address_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address num can't be blank")
      end
      it 'phone_numが空だと購入できない' do
        @order.phone_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが10桁か11桁以外だと購入できない' do
        @order.phone_num = '090111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numが半角数値でないと購入できない' do
        @order.phone_num = '０９０１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
