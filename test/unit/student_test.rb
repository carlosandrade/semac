require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @jose_roberto = Student.new(:name => "Jose Roberto", :email => "roberto@null.com", :registration => 20101255)
    @jose_roberto_almeida = Student.new(:name => "Jose Roberto", :email => "roberto@null.com", :registration => 2923132)
  end

  def teardown
    @jose_roberto = nil
    @jose_roberto_almeida = nil
  end

  test "should have a name" do
    @jose_roberto.name = nil
    assert !@jose_roberto.save, "Saved a student without a name"
  end

  test "name should be unique" do
    @jose_roberto.save
    assert !@jose_roberto_almeida.save, "Saved the same name on database, name is not unique"
  end

end
