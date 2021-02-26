class Whistle < ApplicationRecord
    belongs_to :user
    belongs_to :community
    has_rich_text :content
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :cover_image, presence: true
    mount_uploader :cover_image, ImageUploader
end
