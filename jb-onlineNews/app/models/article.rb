class Article < ApplicationRecord
  validates :title, presence: true, on: :create
  validates :body, presence: true, on: :create
  has_many :comentarios, :dependent => :destroy

end
