require "test_helper"
require "minitest/autorun"

include ActionDispatch::TestProcess
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

  test "#previewable_file? with an ActiveStorage variable file" do
    file = fixture_file_upload(Rails.root.join("test/fixtures/files", "walk.jpg"))
    @page = Page.new(file: file)

    assert_equal(true, previewable_file?)
  end

  test "#previewable_file? with an ActiveStorage previewable file" do
    file = fixture_file_upload(Rails.root.join("test/fixtures/files", "dummy.pdf"))
    @page = Page.new(file: file)

    assert_equal(true, previewable_file?)
  end

  test "#previewable_file? with non previewable file" do
    file = fixture_file_upload(Rails.root.join("test/fixtures/files", "dummy.csv"))
    @page = Page.new(file: file)

    assert_equal(false, previewable_file?)
  end

  test "#file_preview_source with a previewable file" do
    file = fixture_file_upload(Rails.root.join("test/fixtures/files", "dummy.pdf"))
    @page = Page.new(file: file)

    assert_instance_of(ActiveStorage::Preview, file_preview_source)
  end

  test "#file_preview_source with a variable file" do
    file = fixture_file_upload(Rails.root.join("test/fixtures/files", "walk.jpg"))
    @page = Page.new(file: file)

    assert_instance_of(ActiveStorage::Variant, file_preview_source)
  end
end
