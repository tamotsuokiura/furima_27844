class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i
  ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  ZENKAKU_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: PASSWORD_REGEX } #英数字をそれぞれ一文字以上持つかつ6文字以上
  validates :nickname, presence: true
  validates :name_kanzi_first, presence: true, format: { with: ZENKAKU_REGEX } #全角漢字ひらがなカナのみ
  validates :name_kanzi_last, presence: true, format: { with: ZENKAKU_REGEX } #全角漢字ひらがなカナのみ
  validates :name_kana_first, presence: true, format: { with: ZENKAKU_KANA_REGEX } #全角カナのみ
  validates :name_kana_last, presence: true, format: { with: ZENKAKU_KANA_REGEX } #全角カナのみ
  validates :birth, presence: true

  # validates :nickname, presence: true
  # validates :name_kanzi_first, presence: true
  # validates :name_kanzi_last, presence: true
  # validates :name_kana_first, presence: true
  # validates :name_kana_last, presence: true
  # validates :birth, presence: true
end
