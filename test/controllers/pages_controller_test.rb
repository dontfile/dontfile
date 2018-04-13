require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.create(
      url: "page_url",
      content: "asdf"
    )
  end

  test "should create page" do
    assert_difference('Page.count') do
      get "/some_page", params: { page: { content: "Some content", url: "some_page" } }
    end

    assert_template :show
  end

  test "should show page" do
    get page_path(@page)
    assert_response :success
  end

  test "should update page" do
    old_content = @page.content

    patch "/#{@page.url}", params: {
      page: {
        content: "New text",
        url: @page.url
      }
    }
    @page.reload

    assert_not_equal old_content, @page.content
  end
end
