require 'rails_helper'
describe "User" do

  describe "#create" do

    context "登録ができないとき" do

      before do 
        @user = build(:user)
      end

      it "nickname空NG" do
        @user.nickname = "" 
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it "email空NG" do
        @user.email = ""
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it "email@なしNG" do
        @user.email = "dnasjfnasnfnfnsdonfoi"
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end

      it "email重複NG" do
        user1 = create(:user)
        @user.email = user1.email
        @user.valid?
        expect(@user.errors[:email]).to include("has already been taken")
      end

      it "password文字だけNG" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end

      it "password数字だけNG" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end

      it "password全角数字NG" do
        @user.password = "12345六"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end

      it "password英数字5文字NG" do
        @user.password = "1234a"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end

      it "password1回入力のみNG" do
        @user.password_confirmation = "" 
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "name_kanzi_first空NG" do
        @user.name_kanzi_first = ""
        @user.valid?
        expect(@user.errors[:name_kanzi_first]).to include("can't be blank")
      end

      it "name_kanzi_first英語だけNG" do
        @user.name_kanzi_first = "taro"
        @user.valid?
        expect(@user.errors[:name_kanzi_first]).to include("is invalid")
      end

      it "name_kanzi_first全角英語NG" do
        @user.name_kanzi_first = "太ro"
        @user.valid?
        expect(@user.errors[:name_kanzi_first]).to include("is invalid")
      end

      it "name_kana_first空NG" do
        @user.name_kana_first = ""
        @user.valid?
        expect(@user.errors[:name_kana_first]).to include("can't be blank")
      end

      it "name_kana_first英語だけNG" do
        @user.name_kana_first = "taro"
        @user.valid?
        expect(@user.errors[:name_kana_first]).to include("is invalid")
      end

      it "name_kana_first数字だけNG" do
        @user.name_kana_first ="1111"
        @user.valid?
        expect(@user.errors[:name_kana_first]).to include("is invalid")
      end

      it "name_kana_first全角漢字NG" do
        @user.name_kana_first = "太郎"
        @user.valid?
        expect(@user.errors[:name_kana_first]).to include("is invalid")
      end

      it "name_kana_first全角漢字カナNG" do
        @user.name_kana_first = "太ロウ"
        @user.valid?
        expect(@user.errors[:name_kana_first]).to include("is invalid")
      end

      it "birth空NG" do
        @user.birth = "" 
        @user.valid?
        expect(@user.errors[:birth]).to include("can't be blank")
      end
    end

    context "登録が成功したとき" do

      before do 
        @user = build(:user)
      end

      it "name_kanzi_first全角OK" do
        @user.name_kanzi_first = "太ロウ"
        @user.valid?
        expect(@user).to be_valid
      end

      it "name_kana_first全角カナOK" do
        @user.name_kana_first = "タロウ"
        @user.valid?
        expect(@user).to be_valid
      end

      it "password英数字OK" do
        PASSa = "12345a"
        user = build(:user,password: PASSa, password_confirmation: PASSa )
        user.valid?
        expect(user).to be_valid
      end

    end
  end
end