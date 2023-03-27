class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :resipe
end
