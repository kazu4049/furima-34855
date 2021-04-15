require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context 'itemとaddressは登録できること' do
      it '適切な情報を入力すると保存できること' do
        expect(@record_address).to be_valid
      end

      it 'postal_codeは-がないと登録できない' do
        @record_address.postal_code = '123-4567'
        expect(@record_address).to be_valid
      end

      it 'phone_numberは11桁数値のみであれば保存できること' do
        @record_address.phone_number = '09012345678'
        expect(@record_address).to be_valid
      end

      it 'building_nameが空でも登録できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入ができないこと' do
      it 'postal_codeが空では登録できないこと' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが-ハイフンがないと登録できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'shipment_area_idが空だと登録できないこと' do
        @record_address.shipment_area_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Shipment area can't be blank")
      end

      it 'shipment_area_idが0だと登録できないこと' do
        @record_address.shipment_area_id = 0
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include ("Shipment area must be other than 0")
      end

      it 'cityが空だと登録できないこと' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと登録できないこと' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと登録できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字のみでないと登録できないこと' do
        @record_address.phone_number = 'あああああああああああ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角数字だと登録できないこと' do
        @record_address.phone_number = '０９０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上だと登録できないこと' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが英数混合では登録できないこと' do
        @record_address.phone_number = '090123aaaaa'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end


      it 'tokenが空だと登録できないこと' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録できないこと' do
        @record_address.user_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できないこと' do
        @record_address.item_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
