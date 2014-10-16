module Sluggable
  extend ActiveSupport::Concern

  included do
    class_attribute :slug_column
  end

  def to_param
    self.slug
  end

  def generate_slug
    ###   this, has the effect of calling self.title in the Post class
    slug = self.send(self.class.slug_column.to_sym)
    slug = self.title.strip()
    slug.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    slug.gsub! /-+/, "-"

    post = self.class.find_by slug: slug
    if post
      slug += "--"
    end

    count = 2
    while post && post != self
      slug = slug[0...-1] + count.to_s
      post = self.class.find_by slug: slug
      count += 1
    end
    self.slug = slug.downcase
  end

  module ClassMethods
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end
end
