class RepliesMailbox < ApplicationMailbox
  MATCHER = /reply-(.+)@reply.example.com/i

  before_processing :ensure_user

  def process
    return if user.nil?
    p '-------------------------------11111111111'
    discussion.comments.create(
      user: user,
      body: mail.decoded
      )
  end
  
  def user
    p '-------------------------------22222222222'
    @user ||= User.find_by(email: mail.from)
  end
  
  def discussion
    binding.pry
    p '-------------------------------33333333333'
    @discussion ||= Discussion.find(discussion_id)
    p @discussion
  end

  def discussion_id
    p '-------------------------------44444444444'
    recipient = mail.recipients.find{|r| MATCHER.match?(r)}
    p recipient
    recipient[MATCHER, 1]
  end

  def ensure_user
    p '-------------------------------555555555'
    if user.nil?
      bounce_with UserMailer.missing(inbound_mail)
    end
  end
end

