class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # カラムの追加にて
  attachment :image

  #
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }


end
