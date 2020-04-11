# frozen_string_literal: true

class Page::FilesController < ApplicationController
  before_action :set_page

  def show
    respond_to do |format|
    end
  end

  def create
    respond_to do |format|
    end
  end

  def update
    respond_to do |format|
    end
  end

  def delete
    respond_to do |format|
      @page.file.purge

      format.html { redirect_back(fallback_location: 'show') }
      format.json { render 'show' }
    end
  end

  private

  def set_page
    @page = Page.find_or_create_by(url_param)
  end
end
