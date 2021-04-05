require "./config/environment"

class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
		enable :sessions
		set :session_secret, "password_security"
        set :views, Proc.new { File.join(root, "../views/") }
  
    get "/" do 
        erb :index #registration page
    end 

    get '/register' do 
        erb :register
    end 

    post "/register" do 
        user = User.new(:username => params[:username], :password => params[:password])
        if user.save 
            redirect "/login"
        else 
            redirect "/registration_fail"
        end 
    end 

    get "/login" do 
        erb :login 
    end 

    post "/login" do 
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/user/#{user.id}"
        else 
            redirect "/login_error"
        end 
    end 

    get "/login_error" do 
        erb :login_error
    end 

    get "/not_authorized" do 
        erb :not_authorized
    end 

    get "/registration_fail" do 
        erb :registration_fail
    end 

    get "/logout" do 
        session.clear 
        redirect "/"
    end 

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end