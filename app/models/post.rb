class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :votable

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true
  validates :url, format: {with: /\A((http|https):\/\/)?(([a-z0-9-\.]*)\.)?([a-z0-9-]+)\.([a-z]{2,5})(:[0-9]{1,5})?(\/)?\z/ix}
end
