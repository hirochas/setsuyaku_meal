class Customer < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :resipes, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy  #Customer.commentsで、ユーザーの所有するコメントを取得できる。


    def self.guest
        find_or_create_by!(email: 'guest@guest.com') do |customer|
         customer.password = SecureRandom.urlsafe_base64
         customer.password_confirmation = customer.password
         customer.name = "ゲストユーザー"
        end
    end

    def display_is_deleted
      if self.is_deleted then
          return "無効"
      else
          return "有効"
      end
    end
end

