class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :works, :through => :categorizations
end
