# frozen_string_literal: true

require 'test_helper'

class Page::FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.new(
      url: 'page_url',
      content: 'Some content'
    )
    @page.file.attach(
      io: File.open('public/dontfile.png'),
      filename: 'dontfile.png'
    )
    @page.save!
  end

  # test 'should upload file' do
  #   assert_not @page.file.attached?
  #   patch "/#{@page.url}", params: {
  #     page: {
  #       url: "/#{@page.url}",
  #       file: fixture_file_upload('public/dontfile.png', 'image/png')
  #     }
  #   }
  #   @page.reload

  #   assert @page.file.attached?
  # end

  # test 'should not upload file bigger than max size allowed' do
  #   assert_not @page.file.attached?

  #   reset_max_file_size_constant
  #   assert_equal 0, Page:: qMAX_FILE_SIZE

  #   patch "/#{@page.url}", params: {
  #     page: {
  #       url: "/#{@page.url}",
  #       file: fixture_file_upload('public/dontfile.png', 'image/png')
  #     }
  #   }
  #   assert_response :not_acceptable
  #   @page.reload

  #   assert_not @page.file.attached?

  #   reset_max_file_size_constant(100.0.megabytes)
  #   assert_equal 100.0.megabytes, Page::MAX_FILE_SIZE
  # end

  test 'should delete file' do
    assert_difference 'ActiveStorage::Attachment.count', -1 do
      delete delete_page_file_path(@page.url)
    end

    assert_not @page.reload.file.attached?
  end

  # test 'should create a zip file' do
  #   req_url = "#{@page.url}.zip"
  #   expected_zip_file = "tmp/#{req_url}"

  #   get "/#{req_url}"

  #   assert File.file?(expected_zip_file)
  #   File.delete expected_zip_file
  # end

  # test 'should download a zip file' do
  #   req_url = "#{@page.url}.zip"
  #   expected_zip_file = "tmp/#{req_url}"

  #   get "/#{req_url}"

  #   assert_equal @response.header['Content-Type'], 'application/zip'
  #   assert_equal @response.header['Content-Disposition'],
  #                "attachment; filename=\"#{req_url}\"; filename*=UTF-8''#{req_url}"

  #   File.delete expected_zip_file
  # end

  # test 'should create a zip file with appropriate content' do
  #   image_filename = 'dontfile.png'

  #   @page.file.attach(
  #     io: File.open("public/#{image_filename}"),
  #     filename: image_filename
  #   )
  #   @page.save!

  #   req_url = "#{@page.url}.zip"
  #   expected_zip_file = "tmp/#{req_url}"

  #   get "/#{req_url}"

  #   Zip::File.open(expected_zip_file) do |zip_file|
  #     files = zip_file.map(&:name)
  #     assert_equal files, ["#{@page.url}.txt", image_filename]
  #   end

  #   File.delete expected_zip_file
  # end
end
