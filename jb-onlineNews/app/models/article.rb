class Article < ApplicationRecord
  validates :titulo, presence: true
  # validates :bajada, presence: true
  validates :cuerpo, presence: true

end
