class Page < ApplicationRecord
  validates :url, presence: true, uniqueness: true 
end
