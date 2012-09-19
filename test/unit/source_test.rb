require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Can save with valid URL" do
  	s_google = Source.new({:url => "http://www.google.com"})
  	assert s_google.save
    s_google.destroy
  end

  test "Raise exception when saving without URL" do
  	begin
      s_invalid = Source.new({:url => "peaches"})
    	s_invalid.save
    rescue RuntimeError
      assert s_invalid.new_record?
    end
  end



  ####Source_type####

  test "Source_types exist with methods for sum?" do
    assert Source_type.where(:flags => 0).first.sum?
  end


end

