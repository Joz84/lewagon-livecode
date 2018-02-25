class Batch < ApplicationRecord
  require 'open-uri'
  has_many :batch_teachers
  has_many :teachers, through: :batch_teachers

  def repositories
    repositories = []
    teachers.each do |teacher|
      url = "https://api.github.com/users/#{teacher.username}/repos"
      repositories += JSON.parse(open(url).read).select do |repo|
        repo["name"].include?(number.to_s)
      end
    end
    repositories.sort_by{ |repo| DateTime.parse(repo['created_at'])}
  end
end
