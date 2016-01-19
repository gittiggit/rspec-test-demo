class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  scope :latest, ->{order created_at: :desc}
end
