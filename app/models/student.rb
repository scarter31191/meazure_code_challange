class Student < ApplicationRecord
    has_and_belongs_to_many :colleges
    has_and_belongs_to_many :exams
    # attribute :college_id

    validates :first_name, :last_name, presence: true
    validates :phone_number, presence: true, length: { maximum: 11 }
end
