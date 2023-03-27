class Favorite < ApplicationRecord
   belongs_to :customer
   belongs_to :resipe

   validates :customer_id, uniqueness: { scope: :resipe_id }  #同じカスタマーが複数お気に入りできないようにする
end
