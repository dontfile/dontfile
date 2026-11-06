require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.create!(url: "page_url", content: "Some content")
  end

  test "routes page paths to show" do
    assert_routing "/new_page", controller: "pages", action: "show", url: "new_page"
  end

  test "routes PATCH on a page path to update" do
    assert_routing({ method: "patch", path: "/#{@page.url}" }, { controller: "pages", action: "update", url: @page.url })
  end

  test "redirects from the home page form to the page" do
    get root_path, params: { url: "from_home" }

    assert_redirected_to "/from_home"
  end

  test "creates a page on the first visit" do
    assert_difference("Page.count") { get "/some_page" }

    assert_response :success
  end

  test "shows a page" do
    get "/#{@page.url}"

    assert_response :success
    assert_select "textarea", text: "Some content"
  end

  test "updates the page content" do
    patch "/#{@page.url}", params: { page: { content: "New content" } }

    assert_response :no_content
    assert_equal "New content", @page.reload.content
  end

  test "ignores attempts to change the page URL" do
    patch "/#{@page.url}", params: { page: { content: "New content", url: "stolen" } }

    assert_equal "page_url", @page.reload.url
  end

  test "renders the page as JSON" do
    get "/#{@page.url}.json"

    assert_equal "Some content", response.parsed_body["content"]
    assert_equal "http://www.example.com/#{@page.url}.json", response.parsed_body["page_url"]
  end

  test "downloads the page as a zip with the text and the file" do
    @page.file.attach(io: file_fixture("dontfile.png").open, filename: "dontfile.png")

    get "/#{@page.url}.zip"

    assert_equal "application/zip", response.media_type
    assert_equal "attachment; filename=\"#{@page.url}.zip\"; filename*=UTF-8''#{@page.url}.zip", response.headers["Content-Disposition"]
    entries = Zip::File.open_buffer(response.body).to_h { |entry| [ entry.name, entry.get_input_stream.read ] }
    assert_equal [ "#{@page.url}.txt", "dontfile.png" ], entries.keys
    assert_equal "Some content", entries["#{@page.url}.txt"]
    assert_equal file_fixture("dontfile.png").binread, entries["dontfile.png"].b
  end
end
