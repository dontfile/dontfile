module PagesHelper
  def attachment_icon(content_type)
    icon_classes = case content_type
                   when /\/pdf/ then { style: "far", name: "file-pdf" }
                   when /image\// then { style: "far", name: "file-image" }
                   when /\/zip/ then { style: "far", name: "file-archive" }
                   when /video\// then { style: "far", name: "file-video" }
                   else
                     { style: "far", name: "file-alt" }
    end

    icon(icon_classes[:style], icon_classes[:name])
  end

  def previewable_file?
    @page.file.previewable? || @page.file.variable?
  end

  def file_preview_source
    if @page.file.previewable?
      @page.file.preview(resize: "500x700")
    elsif @page.file.variable?
      @page.file.variant(resize: "500x700")
    end
  end
end
