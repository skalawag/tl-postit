class Category < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :category, presence: true, uniqueness: true, length: {minimum: 3}

  before_save :generate_slug

  def generate_slug
    self.slug = self.category.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end
end
