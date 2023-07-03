class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true

  has_rich_text :body

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  enum status: %i[open closed], _default: "open"
  enum status_post: %i[aproved not_aproved], _default: "aproved"

end
