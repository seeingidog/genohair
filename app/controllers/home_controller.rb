class HomeController < ApplicationController
  
  def index
  end
  
  def analyze
    if person_signed_in? == false
      person = create_new_person
      person.token = params[:token]
      person.save
    else
      unless current_person.has_all_genotypes?
        current_person.populate_genotypes
      end
      
      genotypes = current_person.genotypes
      @personids = genotypes.map {|p| p.personid}.uniq
      @stuff = genotypes.sort_by &:personid
    end
  end
    
    def demo
      genotypes = Genotype.where(:person_id => 1)
      @personids = genotypes.map {|p| p.personid}.uniq
      @stuff = genotypes.sort_by &:personid
      render :analyze
    end
    
end
