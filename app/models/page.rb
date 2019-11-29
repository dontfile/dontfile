class Page < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  has_one_attached :file

  MAX_FILE_SIZE = 100.0.megabytes

  validate :file_size

  private

    def file_size
      if file.attached? && file.byte_size > MAX_FILE_SIZE
        self.file = nil
        errors.add(:file, "File is too big. Max size is 20mb.")
      end
    end
end
