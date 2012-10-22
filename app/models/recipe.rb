class Recipe < ActiveRecord::Base
  attr_accessible :title, :instructions
  belongs_to :created_by, class_name: User
  belongs_to :updated_by, class_name: User
end