require 'pp'
require 'yaml'

def load_library(file_path)
  emoticon_data = YAML.load_file(file_path)
  emoticon_data_with_get_meaning_and_get_emoticon = {}
  
  meanings = {}
  emoticon_data.each { |emoticon_meaning, en_and_jp_emoticons| 
    jp_emoticon = en_and_jp_emoticons[1]
    meanings[jp_emoticon] = emoticon_meaning
  }
  
  jp_emoticons = {}
  emoticon_data.each { |emoticon_meaning, en_and_jp_emoticons| 
    en_emoticon = en_and_jp_emoticons[0]
    jp_emoticon = en_and_jp_emoticons[1]
    jp_emoticons[en_emoticon] = jp_emoticon
  }
  
  
  emoticon_data_with_get_meaning_and_get_emoticon[:get_meaning] = meanings
  emoticon_data_with_get_meaning_and_get_emoticon[:get_emoticon] = jp_emoticons
   
  return emoticon_data_with_get_meaning_and_get_emoticon
end

def get_japanese_emoticon(file_path, en_emoticon)
  load_library(file_path)[:get_emoticon][en_emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jp_emoticon)
  load_library(file_path)[:get_meaning][jp_emoticon] || "Sorry, that emoticon was not found"
end