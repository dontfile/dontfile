class PagesController < ApplicationController
  before_action :set_page, only: [:find, :show, :update]

  def find
    if(@page.nil?)
      @page = Page.new(page_params)
      @page.save
    end

    render "show"
  end


  # RAILS STUFF

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    # puts "ENTROU NO LUGAR"
    respond_to do |format|
      if @page.update(page_params)
        format.html { }
        format.json { }
      else
        # format.html { render :edit }
        # format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by(url: params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.permit(:content, :url)
    end
end
