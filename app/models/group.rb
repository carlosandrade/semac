class Group < ActiveRecord::Base
  belongs_to :teacher
  has_many :activities
end
