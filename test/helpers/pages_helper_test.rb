require "test_helper"
include FontAwesome::Sass::Rails::ViewHelpers

class PagesHelperTest < ActionView::TestCase
  test "should get the icon of video when a video uploaded" do
    assert_dom_equal(%{<i class="far fa-file-video"></i>}, attachment_icon("video/mp4"))
  end

  test "should get the icon of image when an image uploaded" do
    assert_dom_equal(%{<i class="far fa-file-image"></i>}, attachment_icon("image/jpeg"))
  end

  test "should get the icon of zip when zip file uploaded" do
    assert_dom_equal(%{<i class="far fa-file-archive"></i>}, attachment_icon("application/zip"))
  end

  test "should get the icon of pdf when pdf file uploaded" do
    assert_dom_equal(%{<i class="far fa-file-pdf"></i>}, attachment_icon("application/pdf"))
  end

  test "should get the default icon when another extension file uploaded" do
    assert_dom_equal(%{<i class="far fa-file-alt"></i>}, attachment_icon("application/csv"))
  end
end
