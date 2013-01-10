class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :token, :refresh_token
  # attr_accessible :title, :body
  has_many :genotypes
  
  
  def has_all_genotypes?
    gt = self.genotypes.map {|s| s.snp_id.to_i}
    snp = Snp.all.map {|s| s.id}
    (snp - gt.uniq) == []
  end
  
  def populate_genotypes
    c = Twenty3AndMe::Client.new
    c.token =  self.token
    
    Snp.all.each do |snp|
      results = c.genotypes(snp.name)
      return if results.class == String   #hax. may need some api fixing
      
      results.each do |gt|
        Genotype.create(:snp_id => snp.id, :personid => gt['id'], :data => gt[snp.name], :person_id => self.id)
      end
    end
    
  end
  
end
