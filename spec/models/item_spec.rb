require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      sleep 1
    end

    context '商品登録できる' do
      it 'items_name, content, price, condition_id, postage_id,shipment_area_id, shipping_date_id, category_id,  imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it 'priceが300-9999999間の数値であれば登録できる' do
        @item.price = '1234567'
        expect(@item).to be_valid
      end

      it 'priceが半角数値であれば登録できる' do
        @item.price = '1234567'
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'items_nameが空では登録できないこと' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが価格は半角英数混合では登録できないこと' do
        @item.price = '1a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not included in the list')
      end

      it '価格は半角英語だけでは登録できないこと' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not included in the list')
      end

      it 'priceが全角数値であれば登録できないこと' do
        @item.price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300以下であれば登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが9999999であれば登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'contentが空であれば登録できないこと' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'postage_idが空であれば登録できないこと' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'condition_idが空であれば登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_date_idが空であれば登録できないこと' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'category_idが空であれば登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'shipment_area_idが空であれば登録できないこと' do
        @item.shipment_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment area can't be blank")
      end

      it 'userテーブルと紐ついていないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空であれば登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'postage_idは0だと登録できない。' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'condition_idは0だと登録できない。' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_date_idは0だと登録できない。' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'category_idは0だと登録できない。' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'shipment_area_idは0だと登録できない。' do
        @item.shipment_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment area can't be blank")
      end
    end
  end
end