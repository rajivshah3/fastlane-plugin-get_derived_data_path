require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GetDerivedDataPathHelper
      # class methods that you define here become available in your action
      # as `Helper::GetDerivedDataPathHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the get_derived_data_path plugin helper!")
      end
    end
  end
end
