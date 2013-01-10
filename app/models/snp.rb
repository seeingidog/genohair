class Snp < ActiveRecord::Base
  attr_accessible :aa, :ag, :at, :cc, :cg, :ct, :description, :gg, :gt, :name, :tt
  
  validates_uniqueness_of :name
  
  has_many :genotypes
  
  def self.list
    all.map {|s| s.name}
  end
end
