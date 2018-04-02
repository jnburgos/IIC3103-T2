class Article < ApplicationRecord
  validates :title, presence: true
  # validates :subtitle, presence: true
  validates :body, presence: true
  has_many :comentarios, :dependent => :destroy

end
