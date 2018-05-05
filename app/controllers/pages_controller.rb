class PagesController < ApplicationController
  before_action :set_page

  # GET /page
  # GET /page.json
  def find
    if @page.nil?
      @page = Page.new(create_page_params)
      @page.save
    end

    render 'show'
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

        render 'show'
      else
        # format.html { render :edit }
        # format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_file
    @page.file.purge

    redirect_back(fallback_location: 'show')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find_by(url: params[:url])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def update_page_params
    params.require(:page).permit(:content, :url, :file)
  end

  def create_page_params
    params.permit(:content, :url, :file)
  end
end
