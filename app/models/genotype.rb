class Genotype < ActiveRecord::Base
  attr_accessible :data, :person_id, :snp_id, :personid
  belongs_to :person
  belongs_to :snp
  
  validates :snp_id, :uniqueness => { :scope => :personid }
    
  def analyze
    snp = self.snp
    pm = self.data.downcase
    if snp.respond_to?(pm)
      snp.send(pm)
    else
      pm
    end
  end
end
