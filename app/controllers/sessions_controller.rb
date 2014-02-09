class SessionsController < ApplicationController

  def new
    #renderöi kirjautumissivun
  end

  def create
    # Haeraan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username]

    # Testataan käyttäjänimi ja salasana
    if user and user.authenticate params[:password]
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    #Nollataan sessio
    session[:user_id] = nil

    #Uudelleenohjataan sovellus pääsivulle
    redirect_to root_path
  end
end
