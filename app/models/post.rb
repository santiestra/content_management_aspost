class Post < ApplicationRecord
  after_create :moderation

  private

  def moderation
    ModerationService.send_content(content)
  end
end
