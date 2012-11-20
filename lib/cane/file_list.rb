module Cane
  # Compile the list of files to examine.
  class FileList

    def initialize(glob, exclude = [])
      @glob    = glob
      @exclude = exclude
    end

    def files
      Dir[@glob].reject {|f| excluded?(f) }
    end

    def exclusions
      @exclusions ||= @exclude.flatten.map do |i|
        Dir[i]
      end.flatten.to_set
    end

    def excluded?(file)
      exclusions.include?(file)
    end

  end
end
