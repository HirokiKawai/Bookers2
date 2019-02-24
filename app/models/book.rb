class Book < ApplicationRecord

  # :の後ろはモデル名となる。
  # has_manyとの繋がりを持つ。
  belongs_to :user

  # 投稿フォーム
  validates :body, :title, presence: true
  validates :body, length: {maximum: 200 }

  # # 編集フォーム
  # validates :body, :title, presence: true
  # validates :body, length: {maximum: 200 }

end
