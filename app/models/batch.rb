class Batch < ApplicationRecord
  require 'open-uri'
  require 'nokogiri'
  has_many :batch_teachers
  has_many :teachers, through: :batch_teachers

  def repositories

    # url = "https://kitt.lewagon.com/camps/#{number}/calendar"
    kitt_url = "https://raw.githubusercontent.com/Joz84/lewagon-livecode/master/app/calendars/#{number}.html"
    html_file = open(kitt_url).read
    html_doc = Nokogiri::HTML(html_file)

    repositories = []
    teachers.each do |teacher|
      github_url = "https://api.github.com/users/#{teacher.username}/repos"
      repositories += JSON.parse(open(github_url).read).select do |repo|
        repo["name"].include?(number.to_s)
      end
    end
    repositories.each do |repo|
      github_date = Date.parse(repo['created_at'])
      kitt_date = html_doc.search(".calendar-day-date strong")
                             .select {|e| Date.parse(e.text.strip) == github_date}
                             .first
      if kitt_date
        kitt_content = kitt_date.parent.parent
        repo["kitt_name"] = kitt_content.search(".calendar-day-name")
        repo["kiit_svg"] = repo["kitt_name"].first.inner_html.strip.split("</svg>")[0].html_safe
        repo["kitt_title"] = repo["kitt_name"].children[-1].text.strip
      end
    end
    repositories.sort_by{ |repo| DateTime.parse(repo['created_at'])}
  end
end



