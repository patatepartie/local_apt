require 'find'

module LocalApt
  def self.find_packages_in(location)
    associative_array = Find.find(location).find_all { |filepath| File.extname(filepath) == '.deb' }.map do |filepath|
      filename = File.basename(filepath)
      [filename, filepath]
    end

    Hash[associative_array]
  end
end
