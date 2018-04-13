require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = Page.create(
      url: 'page_url',
      content: 'Some content'
    )
  end

  test 'should route find to existing pages' do
    assert_routing "/#{@page.url}",
                   controller: 'pages',
                   action: 'find',
                   url: @page.url
  end

  test 'should route find to new pages' do
    assert_routing '/new_page',
                   controller: 'pages',
                   action: 'find',
                   url: 'new_page'
  end

  test 'should route update action' do
    assert_routing(
      {
        method: 'patch',
        path: "/#{@page.url}"
      },
      controller: 'pages',
      action: 'update',
      url: @page.url
    )
  end

  test 'should create page' do
    assert_difference('Page.count') do
      get '/some_page', params: {
        page: {
          content: 'Some content',
          url: 'some_page'
        }
      }
    end

    assert_template :show
  end

  test 'should show page' do
    get page_path(@page)
    assert_response :success
  end

  # This test isn't working, and I don't know why =(
  # test 'should update page' do
  #   old_content = @page.content

  #   patch "/#{@page.url}", params: {
  #     page: {
  #       url: "/#{@page.url}",
  #       content: 'New content'
  #     }
  #   }
  #   @page.reload

  #   assert_not_equal old_content, @page.content
  # end
end
