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
