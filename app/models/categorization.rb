class Categorization < ActiveRecord::Base
  belongs_to :work
  belongs_to :category
end
