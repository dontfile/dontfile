module PagesHelper
  def attachment_icon(content_type)
    icon_classes = case content_type
    when /\/pdf/ then { style: "fa", name: "file-pdf" }
    when /image\// then { style: "fa", name: "file-image" }
    when /\/zip/ then { style: "fa", name: "file-archive" }
    when /video\// then { style: "far", name: "file-video" }
    else
      { style: "fa", name: "file-alt" }
   end

    icon(icon_classes[:style], icon_classes[:name])
  end
end
