# Please copy/paste all three classes into this file to submit your solution!
#############Adapter##############
require 'pry'
require 'json'


class Adapter
  attr_accessor :file, :articles

  def initialize(file)
    @file = file
    @articles = self.class.articles(file)
  end

  def self.articles(file)
    JSON.parse(File.read(file))
  end

  def create_objects_from_file
    # create article and category objects here
		    @articles.each do |article_hash|
		      contributor = article_hash["contributor"]
		      title = article_hash["title"]
		      description = article_hash["description"]
		      url = article_hash["url"]
		      publishedAt = article_hash["publishedAt"]
		      category = article_hash["category"]
		      Article.new(title, description, url, contributor, publishedAt, category)
		      Category.new(category)
		    end
				#binding.pry
		    Article.all


	end

end #class end

###########End Adapter#############



################Article#############
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

###########End Article##############



############Category################
require 'pry'

class Category

	attr_accessor :name
	@@all = []

	def initialize(name)
	  @name = name
	  @@all << self
	end

#Class Methods

	def self.all
	  @@all
	end

	def self.find_or_create(category_str)
	  Category.all.find do |category|
	    if category.name == category_str
	      return category
	    else
	      return Category.new(category_str)
	    end
	  end
	end


	def self.top_category
		counts = Hash.new 0
		Category.all.each do |c|
			counts[c.name] += 1
		end
		counts.max_by {|cn, counts| counts}[0]
	end



end #Class End

##############End Category#################
