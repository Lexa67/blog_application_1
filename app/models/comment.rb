class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  validate :validate_comment_count, on: :create

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  def validate_comment_count
    max_comments_per_user = 3 # Максимальное количество комментариев для каждого пользователя
    if user.comments.where(post_id: post.id).count >= max_comments_per_user
    end
  end

  private

  def notify_recipient
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end

end
