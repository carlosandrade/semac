class Group < ActiveRecord::Base
  belongs_to :course
  belongs_to :teacher
  has_many :activities
  has_and_belongs_to_many :students, :join_table => "students_groups"
  has_one :notification

# Group Validations
  # Does not allow group without a year
  validates_presence_of :year

  # Does not allow group without a semester
  validates_presence_of :semester

  # Does not allow group without a number
  validates_presence_of :number

  # Verify if year is a number
  validates_numericality_of :year

  # Only allows semester 01 or 02
  validates_format_of :semester, :with => /[1-2]/

  # Verify if number is a number
  validates_numericality_of :number

  # Does not allow groub without a teacher
  validates_presence_of :teacher_id

  # Does not allow groub without a course
  validates_presence_of :course_id
  
end
