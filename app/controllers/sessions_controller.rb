class SessionsController < ApplicationController

  def new
    #renderöi kirjautumissivun
  end

  def create
    # Haeraan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username]

    # Tallennetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
    if user.nil?
      redirect_to :back, notice: "User #{params[:username]} does not exist!"
    else
      session[:user_id] = user.id

      # Uudelleenohjataan käyttäjä omalle sivulle
      redirect_to user, notice: "Welcome back!"
    end
  end

  def destroy
    #Nollataan sessio
    session[:user_id] = nil

    #Uudelleenohjataan sovellus pääsivulle
    redirect_to root_path
  end
end
