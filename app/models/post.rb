class Post < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :votable

  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, format: {with: /\A\z|\A((http|https):\/\/)?(([a-z0-9-\.]*)\.)?([a-z0-9-]+)\.([a-z]{2,5})(:[0-9]{1,5})?(\/)?\z/ix}

  sluggable_column :title
  before_save :generate_slug

  # def to_param
  #   self.slug
  # end

  # def generate_slug
  #   ###   this, has the effect of calling self.title in the Post class
  #   slug = self.title.strip()
  #   slug.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
  #   slug.gsub! /-+/, "-"

  #   post = Post.find_by slug: slug
  #   if post
  #     slug += "--"
  #   end

  #   count = 2
  #   while post && post != self
  #     slug = slug[0...-1] + count.to_s
  #     post = Post.find_by slug: slug
  #     count += 1
  #   end
  #   self.slug = slug.downcase
  # end
end
