class Contact < ApplicationRecord
    validates :name, :email_address, presence: true
    validates :email_address, uniqueness: true
end
