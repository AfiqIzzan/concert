class Event < ApplicationRecord
    belongs_to :organizer
    has_one_attached :image, dependent: :destroy # Active Storage
    has_many :tickets, dependent: :destroy, inverse_of: :event
    accepts_nested_attributes_for :tickets, reject_if: :all_blank, allow_destroy: true

    enum category: {other: 0, entertainment: 1, education: 2, sport: 3}
    enum subcategory: {Running: 0, Football: 1, Rugby: 2, Tennis: 3, Swimming: 4, Other: 5 }

    validates :name, presence: true
end
