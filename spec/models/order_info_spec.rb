require 'rails_helper'
describe "OrderInfo" do

  describe "#create" do

    context "登録ができないとき" do

      before do 
        @order_info = build(:order_info)
      end

      it "postal_code空NG" do
        @order_info.postal_code = "" 
        @order_info.valid?
        expect(@order_info.errors[:postal_code]).to include("can't be blank")
      end

      it "postal_code-フォーマットNG" do
        @order_info.postal_code = "2222222" 
        @order_info.valid?
        expect(@order_info.errors[:postal_code]).to include("Input ○○○-○○○○")
      end

      it "prefecture1NG" do
        @order_info.prefecture = 1 
        @order_info.valid?
        expect(@order_info.errors[:prefecture]).to include("must be other than 1")
      end

      it "city空NG" do
        @order_info.city = "" 
        @order_info.valid?
        expect(@order_info.errors[:city]).to include("can't be blank")
      end

      it "house_number空NG" do
        @order_info.house_number = "" 
        @order_info.valid?
        expect(@order_info.errors[:house_number]).to include("can't be blank")
      end

      it "tel空NG" do
        @order_info.tel = "" 
        @order_info.valid?
        expect(@order_info.errors[:tel]).to include("can't be blank")
      end

      it "tel全角数字NG" do
        @order_info.tel = "００００００００１２" 
        @order_info.valid?
        expect(@order_info.errors[:tel]).to include("Input Input half-width characters & figure")
      end

      it "tel全角文字NG" do
        @order_info.tel = "あああああああああ" 
        @order_info.valid?
        expect(@order_info.errors[:tel]).to include("Input Input half-width characters & figure")
      end

      it "tel12文字以上NG" do
        @order_info.tel = "1" * 12 
        @order_info.valid?
        expect(@order_info.errors[:tel]).to include("is too long (maximum is 11 characters)")
      end

    end

    context "登録が成功したとき" do

      before do 
        @order_info = build(:order_info)
      end

      it "OK" do
        @order_info.valid?
        expect(@order_info).to be_valid
      end

    end
  end
end