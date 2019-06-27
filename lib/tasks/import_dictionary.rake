
namespace :import do
  task dictionary: :environment do
    filepath = ARGV[1]
    File.open(filepath, "r").each_line do |line|
      DictionaryEntry.create!(word: line.gsub("\r\n", ''))
    end
  end
end
