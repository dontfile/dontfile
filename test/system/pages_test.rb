require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "going to a page from the home page" do
    visit root_url
    fill_in "www.dontfile.com/", with: "my-page"
    click_on "Go!"

    assert_current_path page_path("my-page")
    assert_title "Dontfile | my-page"
  end

  test "saving the text automatically" do
    visit page_url(pages(:one).url)
    fill_in "Text", with: "Saved text"
    sleep 1 # The text saves after the visitor stops typing.

    visit page_url(pages(:one).url)

    assert_field "Text", with: "Saved text"
  end

  test "seeing the text from another visitor" do
    visit page_url(pages(:one).url)
    using_session(:other_visitor) { visit page_url(pages(:one).url) }

    perform_enqueued_jobs do
      fill_in "Text", with: "Shared text"

      using_session(:other_visitor) { assert_field "Text", with: "Shared text" }
    end
  end

  test "uploading and deleting a file" do
    visit page_url(pages(:one).url)
    attach_file "File", file_fixture("dontfile.png")

    assert_text "dontfile.png"
    assert_link "Download File"

    accept_confirm { click_on "Delete File" }

    assert_no_text "dontfile.png"
    assert_no_link "Download File"
  end

  test "refusing a file bigger than the limit" do
    big_file = Tempfile.create([ "big", ".txt" ])
    big_file.write("x" * (Page.max_file_size + 1))
    big_file.flush
    visit page_url(pages(:one).url)

    message = accept_alert { attach_file "File", big_file.path }

    assert_equal "File is too big. Max size is 16 KB.", message
    assert_no_link "Download File"
  end
end
