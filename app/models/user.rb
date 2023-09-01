class User < ApplicationRecord
    validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: 'Only allow letters' }, presence: true
    validates :phone, numericality: { only_numeric: true, message: 'Only allow number' }, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end
