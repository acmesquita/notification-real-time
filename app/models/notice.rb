class Notice < ApplicationRecord

    belongs_to :sender, class_name: "User"
    belongs_to :recipient, class_name: "User"

    after_commit -> { NotificationRelayJob.perform_later(self)}
end
