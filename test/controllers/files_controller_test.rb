require "test_helper"

class FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.create!(url: "page_url", content: "Some content")
  end

  test "uploads a file" do
    patch page_file_path(@page.url), params: { page: { file: fixture_file_upload("dontfile.png", "image/png") } }

    assert_redirected_to page_path(@page.url)
    assert @page.reload.file.attached?
  end

  test "refuses a file bigger than the maximum size" do
    big_file = Rack::Test::UploadedFile.new(file_bigger_than_the_limit, "text/plain", original_filename: "big.txt")

    patch page_file_path(@page.url), params: { page: { file: big_file } }

    assert_response :unprocessable_content
    assert_not @page.reload.file.attached?
  end

  test "deletes the file" do
    @page.file.attach(io: file_fixture("dontfile.png").open, filename: "dontfile.png")

    assert_difference("ActiveStorage::Attachment.count", -1) do
      delete page_file_path(@page.url)
    end

    assert_redirected_to page_path(@page.url)
    assert_not @page.reload.file.attached?
  end
end
