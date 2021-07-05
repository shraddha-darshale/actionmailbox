class ApplicationMailbox < ActionMailbox::Base
  # routing /reply-(.+)@reply.example.com/i => :replies
  # routing :all => :replies 
  routing RepliesMailbox::MATCHER => :replies
end