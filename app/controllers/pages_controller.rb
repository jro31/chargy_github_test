require 'json'
require 'open-uri'

class PagesController < ApplicationController
  def home
  end

  def result
    url = "https://api.github.com/users/#{params[:username]}/repos"
    projects_serialized = open(url).read
    @projects = JSON.parse(projects_serialized)
    get_favourite_language
  end

  def get_favourite_language
    language_array = []
    @projects.each do |project|
      language_array << project["language"]
    end

    language_array.compact! # Remove instances of nil
    languages = language_array.uniq

    count = []
    arr_index = 0
    languages.each do |language|
      count[arr_index] = language_array.count(language)
      arr_index += 1
    end

    arr_index = 0
    count.each do |num|
      @favourite_language = languages[arr_index] if num == count.max
      arr_index += 1
    end
  end
end
