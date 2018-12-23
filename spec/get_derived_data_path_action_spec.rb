require 'spec_helper'

describe Fastlane::Actions::GetDerivedDataPathAction do
  describe '#run' do
    it 'prints an error message when no folder is found' do
      expect(Fastlane::UI).to receive(:error)

      Fastlane::Actions::GetDerivedDataPathAction.run(workspace_path: '')
    end
    it 'prints a success message when the folder is found' do
      expect(Fastlane::UI).to receive(:success)

      Fastlane::Actions::GetDerivedDataPathAction.run(workspace_path: '')
    end
  end
end
