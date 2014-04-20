require 'active_support/core_ext/string/inflections'

class GenerateCode
  @path_to_template
  @path_to_source

  def initialize(path_to_template)
    @path_to_template = path_to_template
  end

  def generate_file(generate_name, template_name, suffix_name, path_to_source)
    @path_to_source = path_to_source

    lines_of_template = []
    File.open(@path_to_template + template_name, 'r') do |file_template|
      while line = file_template.gets
        lines_of_template.append line
      end
    end

    generate_name_trim = generate_name.strip
    names = generate_name_trim.split('_')
    new_cname = generate_name_trim.underscore.camelize
    new_fname = generate_name_trim.downcase
    new_const = generate_name_trim.upcase

    File.open(@path_to_source + new_fname + suffix_name, 'w') do |file_code|
      lines_of_template.each do |line|
        line_code = line.gsub('XXX', new_cname).gsub('###', new_const)
        file_code.puts line_code
        #file_code.puts "\n"
      end
    end
  end
end