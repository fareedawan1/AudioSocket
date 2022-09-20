# frozen_string_literal: true

# class user
class User < ApplicationRecord
  extend Devise::Models

  has_one_attached :image
  has_many :auditions, dependent: :destroy
  has_many :albums, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Constants
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

  # Enums
  enum role: %i[artist manager]

  # Validations
  validates :password,
            presence: true,
            format: { with: PASSWORD_FORMAT }
  validates :role, presence: true
end
