class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :votable, polymorphic: true

  # pass an array of columns to scope
  # see: http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#method-i-validates_uniqueness_of
  validates_uniqueness_of :creator, scope: [:votable_id, :votable_type]
end
