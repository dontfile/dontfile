# frozen_string_literal: true

class PagesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :set_page

  def index; end

  def show
    respond_to do |format|
      format.zip { download_zip_file }
      format.any(:html, :json) { render 'show' }
    end
  end

  def update
    respond_to do |format|
      if @page.update(update_page_params)
        format.any(:html, :json) { render 'show' }
      else
        format.html { render 'show', status: :not_acceptable }
        format.json { render json: @page.errors, status: :not_acceptable }
      end
    end
  end

  def delete_file
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

  def update_page_params
    params.require(:page).permit(:content, :url, :file)
  end

  def create_page_params
    params.permit(:content, :url, :file)
  end

  def url_param
    params.permit(:url)
  end

  def download_zip_file
    zip_filename = "tmp/#{@page.url}.zip"

    Zip::File.open(zip_filename, Zip::File::CREATE) do |zipfile|
      zipfile.get_output_stream("#{@page.url}.txt") { |f| f.write @page.content }

      if @page.file.attached?
        filepath = ActiveStorage::Blob.service.path_for @page.file.key
        zipfile.add(@page.file.filename.to_s, filepath)
      end
    end

    send_file zip_filename
  end
end
