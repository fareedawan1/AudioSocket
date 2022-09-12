# frozen_string_literal: true

module Ckeditior
  class Asset < ActiveRecord::Base
    include Ckeditor::Orm::ActiveRecord::AssetBase
    include Ckeditor::Backend::Paperclip
    include ActiveRecord
    include Ckeditor::Backend::CarrierWave
  end
end
