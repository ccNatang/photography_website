class Gallery < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates :title, presence: true
end
