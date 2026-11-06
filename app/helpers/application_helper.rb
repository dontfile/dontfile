module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def icon(style, name)
    tag.i(class: "#{style} fa-#{name}")
  end
end
