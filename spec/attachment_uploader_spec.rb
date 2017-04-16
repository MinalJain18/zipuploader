require 'carrierwave/test/matchers'

describe AttachmentUploader do
  include CarrierWave::Test::Matchers

  let(:note) { double('note') }
  let(:uploader) { AttachmentUploader.new(note, :attachment) }

  before do
    AttachmentUploader.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }
  end

  after do
    AttachmentUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it "scales down a landscape image to be exactly 64 by 64 pixels" do
      expect(uploader.thumb).to have_dimensions(64, 64)
    end
  end



  it "has the correct format" do
    expect(uploader).to be_format('zip')
  end
end