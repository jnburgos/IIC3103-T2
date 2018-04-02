class Article < ApplicationRecord
  validates :titulo, presence: true
  # validates :bajada, presence: true
  validates :cuerpo, presence: true
  has_many :comentarios, :dependent => :destroy

end
