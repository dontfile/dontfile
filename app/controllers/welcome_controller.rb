class WelcomeController < ApplicationController
  before_action :set_page
  
  def redirect
    if params[:input_url] != nil
      if @page.nil?
        @page = Page.new(create_page_params)
        @page.save
      end
      render 'show'
    else
      render 'index'
    end
  end

  def index; end

  def show; end

  private
  
  def set_page
    @page = Page.find_by(url: params[:input_url])
  end
  
  def create_page_params
    params.permit(:content, :input_url, :file)
  end
  
end
