module PagesHelper
  def attachment_icon(content_type)
    case content_type
    when %r{/pdf} then render "icons/file_earmark_pdf"
    when %r{image/} then render "icons/file_earmark_image"
    when %r{/zip} then render "icons/file_earmark_zip"
    when %r{video/} then render "icons/file_earmark_play"
    else render "icons/file_earmark_text"
    end
  end
end
