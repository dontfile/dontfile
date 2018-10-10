class Page < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  has_one_attached :file

  MAX_FILE_SIZE = 20.0.megabytes

  validate :file_size

  def update_filename(new_file_name)
    return unless new_file_name.present?

    file_extension = file_blob.filename.extension

    file_blob.filename = [new_file_name, file_extension].join(".")

    file_blob.save!
  end

  private

    def file_size
      if file.attached? && file.byte_size > MAX_FILE_SIZE
        file.purge
        errors.add(:file, "File is too big. Max size is 20mb.")
      end
    end
end
