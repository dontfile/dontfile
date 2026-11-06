module PageScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_page
  end

  private
    def set_page
      @page = Page.find_or_create_by(url: params[:url])
    end
end
