require "test_helper"

class PagesHelperTest < ActionView::TestCase
  test "shows the video icon for videos" do
    assert_match "bi-file-earmark-play", attachment_icon("video/mp4")
  end

  test "shows the image icon for images" do
    assert_match "bi-file-earmark-image", attachment_icon("image/jpeg")
  end

  test "shows the archive icon for zip files" do
    assert_match "bi-file-earmark-zip", attachment_icon("application/zip")
  end

  test "shows the PDF icon for PDFs" do
    assert_match "bi-file-earmark-pdf", attachment_icon("application/pdf")
  end

  test "shows the default icon for other files" do
    assert_match "bi-file-earmark-text", attachment_icon("application/csv")
  end
end
