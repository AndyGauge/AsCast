require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Can save with valid URL" do
  	s_google = Source.new({:url => "http://www.google.com"})
  	assert s_google.save
  end

  test "Raise exception when saving without URL" do
  	s_invalid = Source.new({:url => "peaches"})
  	assert !s_invalid.save
  end
end

