require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @student = Student.new(:name => "Jose Roberto", :email => "roberto@null.com", :registration => 20101255)
  end

  def teardown
    @student = nil
  end

  test "should have a name" do
    @student.name = nil
    assert !@student.save, "Saved a student without a name"
  end

end
