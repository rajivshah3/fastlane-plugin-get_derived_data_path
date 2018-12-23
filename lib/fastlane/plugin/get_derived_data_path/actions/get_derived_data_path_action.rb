require 'fastlane/action'
require 'fastlane_core/core_ext/cfpropertylist'
require 'plist'
require_relative '../helper/get_derived_data_path_helper'

# Based on:
# https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clear_derived_data.rb
# https://gist.github.com/caius/1341516

module Fastlane
  module Actions
    class GetDerivedDataPathAction < Action
      def self.run(params) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        UI.message('The get_derived_data_path plugin is working!')
        preferences = xcode_preferences
        return UI.error('Could not find Xcode preferences') if preferences.nil?

        workspace_path = get_workspace_path(params[:workspace_path])
        workspace_name = workspace_path.split('/')[-1].split('.')[0].sub(/ /, '_')
        derived_data_path = find_derived_data_path(preferences)

        Dir.chdir derived_data_path
        possible_folders = Dir.glob("#{workspace_name}-*")
        UI.error("Could not find matching folder for #{workspace_name} in DerivedData") if possible_folders.nil?
        possible_folders.each do |folder|
          path = "#{derived_data_path}/#{folder}"
          info_plist = Plist.parse_xml("#{path}/info.plist")
          UI.success(path) if info_plist['WorkspacePath'] == workspace_path
        end
      end

      # Helper methods
      def self.xcode_preferences
        file = File.expand_path('~/Library/Preferences/com.apple.dt.Xcode.plist')
        if File.exist?(file)
          plist = CFPropertyList::List.new(file: file).value
          return CFPropertyList.native_types(plist) unless plist.nil?
        end
        nil
      end

      def self.get_workspace_path(path)
        # Get the path to the actual workspace if we're given an xcproj path
        path.concat('/project.xcworkspace') unless path =~ /.xcworkspace/i
        path
      end

      def self.find_derived_data_path(preferences)
        # If 'IDECustomDerivedDataLocation' doesn't exist, the folder is in the default location
        derived_data_path = preferences['IDECustomDerivedDataLocation'] || '~/Library/Developer/Xcode/DerivedData'
        derived_data_path = File.expand_path(derived_data_path)
        derived_data_path
      end

      def self.description
        'Retrieves the path of a workspace in Xcode DerivedData'
      end

      def self.authors
        ['Rajiv Shah']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
        'Returns the path in DerivedData'
      end

      def self.details
        # Optional:
        'Retrieves the path of a workspace in Xcode DerivedData'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :workspace_path,
                                       env_name: 'GET_DERIVED_DATA_PATH_WORKSPACE_PATH',
                                       description: 'Path to your .xcworkspace or .xcproj',
                                       optional: false,
                                       type: String)
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
