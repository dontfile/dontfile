class PagesController < ApplicationController
  include PageScoped

  skip_before_action :set_page, only: :index

  def index
    redirect_to page_path(params[:url]) if params[:url].present?
  end

  def show
    respond_to do |format|
      format.html
      format.json
      format.zip { send_data zip_file, filename: "#{@page.url}.zip", type: :zip }
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { head :no_content }
        format.json { render :show }
      else
        format.html { head :unprocessable_content }
        format.json { render json: @page.errors, status: :unprocessable_content }
      end
    end
  end

  private
    def page_params
      params.expect(page: [ :content ])
    end

    def zip_file
      Zip::OutputStream.write_buffer do |zip|
        zip.put_next_entry("#{@page.url}.txt")
        zip.write(@page.content.to_s)

        if @page.file.attached?
          zip.put_next_entry(@page.file.filename.to_s)
          @page.file.download { |chunk| zip.write(chunk) }
        end
      end.string
    end
end
