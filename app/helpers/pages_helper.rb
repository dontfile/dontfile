# frozen_string_literal: true

module PagesHelper
  def attachment_icon(content_type)
    icon_classes = case content_type
                   when %r{/pdf} then { style: 'far', name: 'file-pdf' }
                   when %r{image/} then { style: 'far', name: 'file-image' }
                   when %r{/zip} then { style: 'far', name: 'file-archive' }
                   when %r{video/} then { style: 'far', name: 'file-video' }
                   else
                     { style: 'far', name: 'file-alt' }
                   end

    icon(icon_classes[:style], icon_classes[:name])
  end
end
