
# Add local extensions to Prophecy here.
# This file will be loaded by the CLI.

module Prophecy
  class CLI < Thor

    desc "markdown_verseindex", "Add page IDs to versepages.md and generate verse index for TOC"
    def markdown_verseindex

      versepath = File.join('manuscript', 'markdown', 'versepages.md')

      text = IO.read(versepath)

      # Add page IDs
      if text.include?('{:.dhp-verse}')
        text.gsub!('{:.dhp-verse}', '{:.dhp-verse #pageN}')
        n = 1
        while text =~ /#pageN/
          text.sub!('#pageN', "#page#{n}")
          n += 1
        end

        # Backup versepages.md
        FileUtils.cp(versepath, "#{versepath}.bak")

        File.open(versepath, "w"){|f| f << text }
      end

      # TODO

    end

  end
end

