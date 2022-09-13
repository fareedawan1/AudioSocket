# frozen_string_literal: true

# AuditionStatusInteractor
class AuditionStatus
  include Interactor

  delegate :status, :search, :sort_column, :sort_direction, to: :context

  def call # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    context.auditions = case status
                        when 'pending'
                          Audition.search(search).order("#{sort_column}  #{sort_direction}").pending
                        when 'accepted'
                          Audition.search(search).order("#{sort_column}  #{sort_direction}").accepted
                        when 'rejected'
                          Audition.search(search).order("#{sort_column}  #{sort_direction}").rejected
                        when 'deleted'
                          Audition.search(search).order("#{sort_column}  #{sort_direction}").deleted
                        else
                          Audition.search(search).order("#{sort_column}  #{sort_direction}")
                        end
  end
end
