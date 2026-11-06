class FilesController < ApplicationController
  include PageScoped

  def update
    if @page.update(file_params)
      redirect_to page_path(@page.url), status: :see_other
    else
      render "pages/show", status: :unprocessable_content
    end
  end

  def destroy
    @page.file.purge
    redirect_to page_path(@page.url), status: :see_other
  end

  private
    def file_params
      params.expect(page: [ :file ])
    end
end
