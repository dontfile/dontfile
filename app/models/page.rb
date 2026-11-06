class Page < ApplicationRecord
  has_one_attached :file

  validates :url, presence: true, uniqueness: true
  validate :file_size

  broadcasts_refreshes

  def self.max_file_size
    Rails.configuration.dontfile.max_file_size
  end

  private
    def file_size
      return unless file.attached? && file.byte_size > self.class.max_file_size

      self.file = nil
      errors.add(:file, "is too big. Max size is #{ActiveSupport::NumberHelper.number_to_human_size(self.class.max_file_size)}.")
    end
end
