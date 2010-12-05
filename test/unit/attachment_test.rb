require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  def setup 
    file_folder = File.join(ENV['HOME'],"/teste") 
    @attach = Attachment.new(:name => "Trabalho", :extension => "zip", :path => File.read(file_folder) )
  end

  def teardown
    @attach = nil
  end

  # Name tests
  test "should have a name" do
    @attach.name = nil
    assert !@attach.save, "Saved attachment without a name"
  end

  test "name should not exceed 60" do
    @attach.name = "Trabalhoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
    assert !@attach.save, "Attachment with a name over 60 chars has been saved"
  end

  # Path tests
  test "should have a path" do
    @attach.path = nil
    assert !@attach.save, "Saved attachment without a path"
  end

  # Extension tests
  test "should have a extension" do
    @attach.extension = nil
    assert !@attach.save, "Saved attachment without a extension"
  end

  test "extension should not exceed 10" do
    @attach.extension = "zipppppppppppppppppppppppppppppppp"
    assert !@attach.save, "Attachment with a extension over 10 chars has been saved"
  end
end
