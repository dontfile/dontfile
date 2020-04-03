class PagesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :set_page

  # GET /page
  # GET /page.json
  def find
    respond_to do |format|
      format.zip {
        zip_filename = "tmp/#{@page.url}.zip"

        Zip::File.open(zip_filename, Zip::File::CREATE) do |zipfile|
          zipfile.get_output_stream("#{@page.url}.txt") { |f| f.write @page.content }

          if @page.file.attached?
            filepath = ActiveStorage::Blob.service.send(:path_for, @page.file.key)
            zipfile.add(@page.file.filename.to_s, filepath)
          end
        end

        send_file zip_filename
      }

      format.any(:html, :json) { render "show" }
    end
  end

  def index; end

  def show; end

  # PATCH /page
  # PATCH /page.json
  def update
    respond_to do |format|
      if @page.update(update_page_params)
        format.html {}
        format.json {}

        render "show"
      else
        format.html { render "show", status: :not_acceptable }
        format.json { render json: @page.errors, status: :not_acceptable }
      end
    end
  end

  def delete_file
    @page.file.purge

    redirect_back(fallback_location: "show")
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_or_create_by(url: params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_page_params
      params.require(:page).permit(:content, :url, :file)
    end

    def create_page_params
      params.permit(:content, :url, :file)
    end
end
