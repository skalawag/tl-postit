class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :votable

  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, format: {with: /\A\z|\A((http|https):\/\/)?(([a-z0-9-\.]*)\.)?([a-z0-9-]+)\.([a-z]{2,5})(:[0-9]{1,5})?(\/)?\z/ix}

  before_save :generate_slug

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end
end
