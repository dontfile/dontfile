require "test_helper"

class PagesHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "shows the video icon for videos" do
    assert_dom_equal %(<i class="far fa-file-video"></i>), attachment_icon("video/mp4")
  end

  test "shows the image icon for images" do
    assert_dom_equal %(<i class="far fa-file-image"></i>), attachment_icon("image/jpeg")
  end

  test "shows the archive icon for zip files" do
    assert_dom_equal %(<i class="far fa-file-archive"></i>), attachment_icon("application/zip")
  end

  test "shows the PDF icon for PDFs" do
    assert_dom_equal %(<i class="far fa-file-pdf"></i>), attachment_icon("application/pdf")
  end

  test "shows the default icon for other files" do
    assert_dom_equal %(<i class="far fa-file-alt"></i>), attachment_icon("application/csv")
  end
end
