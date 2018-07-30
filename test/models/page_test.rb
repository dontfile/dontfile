require "test_helper"

class PageTest < ActiveSupport::TestCase
  def setup
    @page = Page.create(
      url: "page_url",
      content: "Some text"
    )
  end

  test "should save page" do
    assert @page.save
  end

  test "should save page with a file attached" do
    @page.file.attach(
      io: File.open("public/dontfile.png"),
      filename: "dontfile.png"
    )

    assert @page.save!
    assert @page.file.attached?
  end

  test "should save page without any content" do
    @page.content = ""
    assert @page.save
  end

  test "should not save without url" do
    @page.url = ""
    assert_not @page.save
  end

  test "should not create page with an existing url" do
    another_page = @page.dup
    another_page.url = @page.url
    @page.save

    assert_not another_page.save
  end

  test "should not save a file with size greater than MAX_FILE_SIZE" do
    @page.file.attach(
      io: File.open("public/dontfile.png"),
      filename: "dontfile.png"
    )

    @page.file.byte_size = Page::MAX_FILE_SIZE + 1000

    exception = assert_raises (ActiveRecord::RecordInvalid) { @page.save! }
    assert_equal "Validation failed: File File is too big. Max size is 20mb.", exception.message
    refute @page.file.attached?
  end
end
