class ConversationResponse < ActiveRecord::Base
  validates :trigger, :statement, presence: true
end
