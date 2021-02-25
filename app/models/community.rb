class Community < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :name, uniqueness: true
    has_many :whistles
end
