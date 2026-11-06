# frozen_string_literal: true

require_relative "test_helper"

class PagesTest < E2ETest
  def test_go_to_a_page_from_the_home_page
    path = unique_path
    visit "/"

    assert_text "The dontpad of files"
    within("form") { find_field.set(path) }
    click_button "Go!"

    assert_current_path "/#{path}"
    assert_title "Dontfile | #{path}"
  end

  def test_text_is_saved_automatically
    path = unique_path
    visit "/#{path}"

    type_text "Hello from the e2e suite"
    sleep 2 # Autosave waits for the user to stop typing.
    visit "/#{path}"

    assert_equal "Hello from the e2e suite", text_area.value
  end

  def test_text_shows_up_for_other_visitors_of_the_same_page
    path = unique_path
    visit "/#{path}"

    Capybara.using_session(:other_visitor) { visit "/#{path}" }

    type_text "Shared text"

    Capybara.using_session(:other_visitor) do
      assert_field type: "textarea", with: "Shared text", wait: 15
    end
  end

  def test_upload_download_and_delete_a_file
    path = unique_path
    visit "/#{path}"

    attach_file FIXTURE

    assert_text "dontfile.png"
    download = http_get(find_link("Download File")[:href])
    download = Net::HTTP.get_response(URI(download["location"])) while download.is_a?(Net::HTTPRedirection)
    assert_equal File.binread(FIXTURE), download.body

    accept_confirm { click_button "Delete File" }

    assert_no_text "dontfile.png"
    assert_no_link "Download File"
  end

  def test_files_bigger_than_the_limit_are_refused
    path = unique_path
    visit "/#{path}"
    big_file = File.join(Dir.tmpdir, "#{path}.bin")
    # A sparse file: it takes no disk space, and the browser refuses it before the upload.
    File.open(big_file, "wb") { |f| f.truncate(max_file_size_shown_on_the_page + 1) }

    message = accept_alert { attach_file big_file }

    assert_match(/File is too big/, message)
    visit "/#{path}"
    assert_no_link "Download File"
  ensure
    File.delete(big_file) if big_file && File.exist?(big_file)
  end

  def test_download_the_page_as_a_zip
    path = unique_path
    visit "/#{path}"
    type_text "Zipped text"
    sleep 2
    attach_file FIXTURE
    assert_text "dontfile.png"

    response = http_get("/#{path}.zip")

    assert_equal "application/zip", response["content-type"]
    entries = Zip::File.open_buffer(response.body).to_h { |entry| [ entry.name, entry.get_input_stream.read ] }
    assert_equal [ "#{path}.txt", "dontfile.png" ], entries.keys
    assert_equal "Zipped text", entries["#{path}.txt"]
    assert_equal File.binread(FIXTURE), entries["dontfile.png"].b
  end

  def test_read_the_page_as_json
    path = unique_path
    visit "/#{path}"
    type_text "JSON text"
    sleep 2

    page_json = JSON.parse(http_get("/#{path}.json").body)

    assert_equal path, page_json["url"]
    assert_equal "JSON text", page_json["content"]
  end
end
