# frozen_string_literal: true

json.extract! page, :id, :content, :url, :created_at, :updated_at
json.page_url page_url(page, format: :json)
