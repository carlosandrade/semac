require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup 
    @course = Course.new(:name => "Engenharia de Software I", :code => "MATA62")
  end

  def teardown
    @course = nil
  end
  
#Name tests
  test "should have a name" do
    @course.name = nil
    assert !@course.save, "Saved a course without a name"
  end

  test "name should be unique" do
    @course.save
    @other_course = Course.new(:name => @course.name, :code => "MATB12")
    assert !@other_course.save, "Saved the same name on database, name is not unique"
  end

  test "course name should not exceed 60" do
   @course.name = "Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I Engenharia I"
   assert !@course.save, "Course with a name over 60 chars has been saved"
  end

#Code tests
  test "should have a code" do
    @course.code = nil
    assert !@course.save, "Saved a course without a code"
  end

  test "code should be unique" do
    @course.save
    @other_course = Course.new(:name => "Fisica 3", :code => @course.code)
    assert !@other_course.save, "Saved the same code on database, code is not unique"
  end

  test "course code should not exceed 6" do
   @course.code = "MATA5022222"
   assert !@course.save, "Course with a code over 6 chars has been saved"
  end

end
