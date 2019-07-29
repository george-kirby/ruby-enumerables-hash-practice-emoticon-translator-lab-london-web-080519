# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  key_only_hash = {
    "get_meaning"=>{},
    "get_emoticon"=>{}
  }
  emoticon_library = YAML.load_file(file_path).reduce(key_only_hash) do |memo, (key, value)|
    
    memo["get_meaning"][value[1]] = key
    memo["get_emoticon"][value[0]] = value[1]
    
    memo
  end
  emoticon_library
end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  emoticon_library = load_library(file_path)
  
  if emoticon_library["get_emoticon"][english_emoticon]
    result = emoticon_library["get_emoticon"][english_emoticon]
  else
    result = "Sorry, that emoticon was not found"
  end
end

def get_english_meaning
  # code goes here
end

p load_library('lib/emoticons.yml')