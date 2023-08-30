class Admin < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]
end
