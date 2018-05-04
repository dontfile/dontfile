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
end
