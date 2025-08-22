class Note < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 15}
  validates :content, presence: true, length: {minimum: 5, maximum: 100}
end
