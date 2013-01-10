class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def create_new_person
      uuid = rand(36**64).to_s(36)
      temp_email = "guest_#{uuid}@email_address.com"
      u = Person.create(:email => temp_email)        
      u.save(:validate => false)
      sign_in u
      u
  end
  
end
