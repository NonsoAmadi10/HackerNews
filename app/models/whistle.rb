class Whistle < ApplicationRecord
    belongs_to :user
    belongs_to :community
    has_rich_text :content
    mount_uploader :cover_image, ImageUploader
end
