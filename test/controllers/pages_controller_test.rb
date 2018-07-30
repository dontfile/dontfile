require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.create(
      url: "page_url",
      content: "Some content"
    )
  end

  test "should route find to existing pages" do
    assert_routing "/#{@page.url}",
                   controller: "pages",
                   action: "find",
                   url: @page.url
  end

  test "should route find to new pages" do
    assert_routing "/new_page",
                   controller: "pages",
                   action: "find",
                   url: "new_page"
  end

  test "should route update action" do
    assert_routing(
      {
        method: "patch",
        path: "/#{@page.url}"
      },
      { controller: "pages",
      action: "update",
      url: @page.url }
    )
  end

  test "should create page" do
    assert_difference("Page.count") do
      get "/some_page", params: {
        page: {
          content: "Some content",
          url: "some_page"
        }
      }
    end

    assert_template :show
  end

  test "should show page" do
    get "/#{@page.url})"
    assert_response :success
  end

  test "should update page" do
    patch "/#{@page.url}", params: {
      page: {
        url: "/#{@page.url}",
        content: "New content"
      }
    }
    @page.reload

    assert_equal @page.content, "New content"
  end

  test "should upload file" do
    refute @page.file.attached?
    patch "/#{@page.url}", params: {
      page: {
        url: "/#{@page.url}",
        file: fixture_file_upload("public/dontfile.png", "image/png")
      }
    }
    @page.reload

    assert @page.file.attached?
  end

  # test "should not upload file bigger than max size allowed" do
  #   refute @page.file.attached?

  #   patch "/#{@page.url}", params: {
  #     page: {
  #       url: "/#{@page.url}",
  #       file: my_stub_file_with_big_size
  #     }
  #   }
  #   assert_response :not_acceptable
  #   @page.reload

  #   refute @page.file.attached?
  # end

  test "should delete file" do
    @page.file.attach(
      io: File.open("public/dontfile.png"),
      filename: "dontfile.png"
    )
    @page.save!

    assert @page.file.attached?

    assert_difference "ActiveStorage::Attachment.count", -1 do
      delete delete_file_path, params: {
        url: @page.url
      }
    end

    @page.reload
    refute @page.file.attached?
  end
end
