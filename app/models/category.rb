class Category < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :category, presence: true, uniqueness: true, length: {minimum: 3}
end
