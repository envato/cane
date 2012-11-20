require 'spec_helper'

require 'cane/file_list'

describe Cane::FileList do

  let(:directory) { Dir.mktmpdir }
  let!(:file)     { Tempfile.new("", directory) }

  it "lists files" do
    file_list = described_class.new("#{directory}/*")
    file_list.files.should == [file.path]
  end

  it "skips declared exclusions" do
    file_list = described_class.new("#{directory}/*", [file.path])
    file_list.files.should be_empty
  end

  it "skips declared glob-based exclusions" do
    file_list = described_class.new("#{directory}/*", ["#{directory}/*"])
    file_list.files.should be_empty
  end

end
