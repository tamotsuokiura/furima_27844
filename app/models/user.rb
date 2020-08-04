class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i
  ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  ZENKAKU_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: PASSWORD_REGEX } #英数字をそれぞれ一文字以上持つかつ6文字以上

  with_options format: { with: ZENKAKU_REGEX } do #全角漢字ひらがなカナのみ 
    validates :name_kanzi_first
    validates :name_kanzi_last
  end

  with_options format: { with: ZENKAKU_KANA_REGEX } do #全角カナのみ
    validates :name_kana_first
    validates :name_kana_last
  end

  with_options presence: true do 
    validates :nickname, presence: true
    validates :name_kanzi_first
    validates :name_kanzi_last
    validates :name_kana_first
    validates :name_kana_last
    validates :birth
  end

  validates :nickname, uniqueness: { case_sensitive: true }

end
