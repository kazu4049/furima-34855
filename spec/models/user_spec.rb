require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "", email: "a@gmail.com", password: "123abc", password_confirmation: "00000000")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
   end
 end