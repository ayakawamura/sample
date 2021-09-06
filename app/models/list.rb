class List < ApplicationRecord
  attachment :image
  
#   バリデーション機能の追加　文字入力しないと投稿できなくする
  validates :title,presence: true
  validates :body,presence:true
  validates :image,presence:true

end
