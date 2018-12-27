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
end
