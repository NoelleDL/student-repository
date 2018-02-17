def source_code(filename)
  File.open(filename, 'r').each_line { |line| puts line }
end

source_code(__FILE__)
