require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  def setup 
    @attach = Attachment.new(:name => "Trabalho", :extension => "zip", :path => "/caminho/do/anexo")
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

  test "path should not exceed 100" do
    @attach.path = "/caminho/do/anexooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
    assert !@attach.save, "Attachment with a path over 100 chars has been saved"
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
