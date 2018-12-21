require 'json'
require 'open-uri'

class PagesController < ApplicationController
  def home
  end

  def result
    url = "https://api.github.com/users/#{params[:username]}/repos"
    projects_serialized = open(url).read
    @projects = JSON.parse(projects_serialized)

    language_array = []
    @projects.each do |project|
      language_array << project["language"]
    end


  end
end
