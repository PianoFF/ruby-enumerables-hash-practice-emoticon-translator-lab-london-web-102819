# require modules here
require "yaml"
require "pry"

def load_library (yaml)
  emoticon = YAML.load_file(yaml)
  emoticon_hsh= Hash.new
  emoticon_hsh = {"get_meaning":{ }, "get_emoticon":  { }}
  emoticon.each{|key,value|
  
  # if japanese_emoticon 
  emoticon_hsh[:get_meaning][value[1]] =  key
  
  # if English_emoticon
  emoticon_hsh[:get_emoticon][value[0]]= emoticon[key][1]
  #   end 
}

emoticon_hsh
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hsh=load_library (path)
    if emoticon_hsh[:get_emoticon].key?(emoticon)
      return emoticon_hsh[:get_emoticon][emoticon]
    else 
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(path,emoticon)
  emoticon_hsh=load_library(path)

    if emoticon_hsh[:get_meaning].key?(emoticon)
      return emoticon_hsh[:get_meaning][emoticon]
    else
      "Sorry, that emoticon was not found"
    end
end
