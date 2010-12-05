require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(:year => 2010, :semester => 02, :number => 1, :teacher_id => 1, :course_id => 1)
  end

  def teardown
    @group = nil
  end

# Validations tests
  test "group should have a year" do
    @group.year = nil
    assert !@group.save, "Saved a group without a year"
  end

  test "group should have a semester" do
    @group.semester = nil
    assert !@group.save, "Saved a group without a semester"
  end

  test "group should have a number" do
    @group.number = nil
    assert !@group.save, "Saved a group without a number"
  end

  test "year must be a number" do
    @group.year = "palavra"
    assert !@group.save, "Year is not a number"
  end

  test "semester must be 1 or 2" do
    @group.semester = "5"
    assert !@group.save, "Semester is not a valid number"
  end

  test "number must be a number" do
    @group.number = "palavra"
    assert !@group.save, "Number is not a number"
  end

# Relationship tests
  test "group must belong to a teacher" do
    @group.teacher_id = nil
    assert !@group.save, "Saved a group without a teacher"
  end

  test "group must belong to a course" do
    @group.course_id = nil
    assert !@group.save, "Saved a group without a course"
  end
end
