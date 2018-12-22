describe Fastlane::Actions::GetDerivedDataPathAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The get_derived_data_path plugin is working!")

      Fastlane::Actions::GetDerivedDataPathAction.run(nil)
    end
  end
end
