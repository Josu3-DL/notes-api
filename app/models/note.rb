class Note < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 20}
  validates :content, presence: true, length: {minimum: 5, maximum: 100}

  before_validation :status_default

  scope :by_title, ->( title ) { where("title LIKE ?", "%#{title}%") if title.present? }
  scope :by_status, ->( status ) { where(status: status) if status.present? }
  scope :by_priority, ->( priority ) { where(priority: priority) if priority.present? }

  def status_default
    self.status = 'Verified' if self.status.nil?
    self.priority = 'Normal' if self.priority.nil?
  end
end
