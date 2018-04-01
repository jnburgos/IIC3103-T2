class Post < ApplicationRecord
  has_many :opinions
  validates :titulo, presence: true
  validates :bajada, presence: true
  validates :cuerpo, presence: true
end
