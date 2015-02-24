CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = ActionController::Base.asset_host
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end