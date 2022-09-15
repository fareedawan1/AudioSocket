# frozen_string_literal: true

# usermailer
class UserMailer < ApplicationMailer
  def acceptance_email(audition)
    @audition = audition
    mail(to: @audition.email)
  end

  def rejection_email(audition)
    @audition = audition
    mail(to: @audition.email)
  end
end
