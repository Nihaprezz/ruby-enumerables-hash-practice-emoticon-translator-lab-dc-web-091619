# require modules here
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  
  result
end

def get_japanese_emoticon(file_path, entered_emoticon)
  library = load_library(file_path)
  
  if library["get_emoticon"].include?(entered_emoticon)
    library["get_emoticon"][entered_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, entered_emoticon)
  library = load_library(file_path)
  
  if library["get_meaning"].include?(entered_emoticon)
    library["get_meaning"][entered_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end