class Account < ApplicationRecord
  has_many :source_histories, class_name: 'History', foreign_key: 'source_account_id'
  has_many :destination_histories, class_name: 'History', foreign_key: 'destination_account_id'
end
