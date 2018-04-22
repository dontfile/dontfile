class Page < ApplicationRecord
  validates :url, presence: true, uniqueness: true 
  has_one_attached :file  
end
