require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do

    context "商品の投稿ができないとき" do
      before do
        @item = build(:item)
        @item.image = fixture_file_upload('public/images/test_image.png')
      end

      it "image空NG" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "name空NG" do
        @item.name = "" 
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it "name41文字以上NG" do
        @item.name = "あ" * 41 
        @item.valid?
        expect(@item.errors[:name]).to include("is too long (maximum is 40 characters)")
      end

      it "description空NG" do
        @item.description = "" 
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it "description1001文字以上NG" do
        @item.description = "あ" * 1001 
        @item.valid?
        expect(@item.errors[:description]).to include("is too long (maximum is 1000 characters)")
      end

      it "category1NG" do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors[:category_id]).to include("must be other than 1")
      end

      it "condition1NG" do
        @item.condition_id = 1 
        @item.valid?
        expect(@item.errors[:condition_id]).to include("must be other than 1")
      end

      it "carriage1NG" do
        @item.carriage_id = 1 
        @item.valid?
        expect(@item.errors[:carriage_id]).to include("must be other than 1")
      end

      it "area1NG" do
        @item.area_id = 1 
        @item.valid?
        expect(@item.errors[:area_id]).to include("must be other than 1")
      end

      it "duration1NG" do
        @item.duration_id = 1 
        @item.valid?
        expect(@item.errors[:duration_id]).to include("must be other than 1")
      end

      it "price全角NG" do
        @item.price = "元気"
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it "price299以下NG" do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it "price10000000以上NG" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end
    end


    context "商品の投稿が成功したとき" do

      before do
        @item = build(:item)
        @item.image = fixture_file_upload('public/images/test_image.png')
      end

      it "OK" do
        @item.valid?
        expect(@item).to be_valid
      end

    end

  end
end
