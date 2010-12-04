class Submission < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity
  has_one :attachment
end
