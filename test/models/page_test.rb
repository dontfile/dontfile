require "test_helper"

class PageTest < ActiveSupport::TestCase
  setup do
    @page = Page.new(url: "page_url", content: "Some text")
  end

  test "saves a page" do
    assert @page.save
  end

  test "saves a page with a file attached" do
    @page.file.attach(io: file_fixture("dontfile.png").open, filename: "dontfile.png")

    assert @page.save
    assert @page.file.attached?
  end

  test "saves a page without content" do
    @page.content = ""

    assert @page.save
  end

  test "requires a URL" do
    @page.url = ""

    assert_not @page.save
  end

  test "requires a unique URL" do
    @page.save!

    assert_not Page.new(url: @page.url).save
  end

  test "refuses a file bigger than the maximum size" do
    @page.file.attach(io: file_bigger_than_the_limit, filename: "big.txt")

    error = assert_raises(ActiveRecord::RecordInvalid) { @page.save! }

    assert_equal "Validation failed: File is too big. Max size is 16 KB.", error.message
    assert_not @page.file.attached?
  end
end
