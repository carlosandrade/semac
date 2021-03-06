require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup 
    @atividade = Activity.new(:title => "Prova", :specification => "Assuntos da prova", :delivery_date => Date.civil(2010,11,20), :group_id => 1)
  end

  def teardown 
    @atividade_1 = nil
  end

#Title tests

  test "activity must have a title" do
    @atividade.title = nil
    assert !@atividade.save, "Activity without title has been saved"  
  end

#Specification tests

  test "activity must have a specification" do
    
    @atividade.specification = nil
    assert !@atividade.save, "Activity without specification has been saved"
  end

#Group tests

  test "activity must be owned by a group" do
    
    @atividade.group_id = nil
    assert !@atividade.save, "Activity without group has been saved"
  end

end
