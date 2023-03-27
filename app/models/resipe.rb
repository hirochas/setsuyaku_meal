class Resipe < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  belongs_to :genre
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy  #Resipe.commentsで、投稿が所有するコメントをを取得できる。


  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by(customer)
    Favorite.find_by(customer_id: customer.id, resipe_id: id)
  end
end
