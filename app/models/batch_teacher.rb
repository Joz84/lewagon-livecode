class BatchTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
  validates :user, uniqueness: { scope: :batch }
end
