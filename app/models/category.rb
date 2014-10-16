class Category < ActiveRecord::Base
  include Sluggable

  belongs_to :user
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :category, presence: true, uniqueness: true, length: {minimum: 3}

  sluggable_column :category
  before_save :generate_slug

end
