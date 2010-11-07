require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup 
    @atividade = Activity.new(:title => "Prova", :specification => "Assuntos da prova", :delivery_date => Date.civil(2010,11,20))
  end

  def teardown 
    @atividade_1 = nil
  end

  test "activity must have a title" do
    @atividade.title = nil
    assert !@atividade.save, "Activity without title has been saved"  
  end

end
