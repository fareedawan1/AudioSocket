# frozen_string_literal: true

# class user
class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[artist manager]
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

  validates :password,
            presence: true,
            format: { with: PASSWORD_FORMAT },
            confirmation: true
end
