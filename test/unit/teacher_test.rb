require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def setup
    @teacher = Teacher.new(:name => "Paulo", :email => "paulo@null.com", :registration =>123)
  end

  def teardown
    @teacher = nil
  end

# Name test
  test "should have a name" do
    @teacher.name = nil
    assert !@teacher.save, "Saved teacher without a name"
  end

  test "name should be unique" do
    @teacher.save
    @teacher_novo = Teacher.new(:name => @teacher.name, :email => "juc@null.com", :registration => 145)
    assert !@teacher_novo.save, "Saved the same name on database, name is not unique"
  end

  test "teacher name should not exceed 100" do
    @teacher.name = "Paulooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
    assert !@teacher.save, "Teacher with a name over 100 chars has been saved"
  end

# Email test
  test "should have a email" do
    @teacher.email = nil
    assert !@teacher.save, "Saved teacher without a email"
  end

  test "email should be unique" do
    @teacher.save
    @teacher_novo = Teacher.new(:name => "Juc", :email => @teacher.email, :registration => 444)
    assert !@teacher_novo.save, "Saved the same email on database, email is not unique"
  end

# Registration test
  test "should have a registration" do
    @teacher.registration = nil
    assert !@teacher.save, "Saved teacher without a registration"
  end
  
  test "registration should be a number" do
    @teacher.registration = "palavra"
    assert !@teacher.save, "Registration is not a number"
  end

  test "registration should be unique" do
    @teacher.save
    @teacher_novo = Teacher.new(:name => "Juc", :email => "juc@null.com", :registration => @teacher.registration)
    assert !@teacher_novo.save, "Saved the same registration on database, registration is not unique"
  end

# Group test
  test "should have groups" do
    assert_equals([], @teacher.save.groups)
  end
end
