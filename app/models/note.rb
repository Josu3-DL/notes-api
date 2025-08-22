class Note < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 20}
  validates :content, presence: true, length: {minimum: 5, maximum: 100}

  scope :by_title, ->( title ) { where("title LIKE ?", "%#{title}%") if title.present? }
  scope :by_status, ->( status ) { where(status: status) if status.present? }
  scope :by_priority, ->( priority ) { where(priority: priority) if priority.present? }
end
