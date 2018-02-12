require 'pry'

class Article

  attr_accessor :title, :description, :url, :contributor, :publishedAt, :category
  @@all = []

  def initialize(title, description, url, contributor, publishedAt, category)
    @title = title
    @description = description
    @url = url
    @contributor = contributor
    @publishedAt = publishedAt
    @category = category
    @@all << self
  end

#Class Methods
  def self.all
    @@all
  end

  def self.find_all_by_category(category)
    Article.all.select do |article|
      if article.category == category
        article
      end
    end
  end

end #Class end
