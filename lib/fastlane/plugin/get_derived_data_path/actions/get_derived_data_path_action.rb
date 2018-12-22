require 'fastlane/action'
require_relative '../helper/get_derived_data_path_helper'

module Fastlane
  module Actions
    class GetDerivedDataPathAction < Action
      def self.run(_params)
        UI.message('The get_derived_data_path plugin is working!')
      end

      def self.description
        'Retrieves the path of a workspace in DerivedData'
      end

      def self.authors
        ['Rajiv Shah']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        'Retrieves the path of a workspace in DerivedData'
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GET_DERIVED_DATA_PATH_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(_platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
