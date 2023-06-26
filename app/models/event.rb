class Event < ApplicationRecord
    belongs_to :organizer
    has_one_attached :poster, dependent: :destroy # Active Storage
end
