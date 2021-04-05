class UserController < ApplicationController
    get "/user/:id" do 
        @user = User.find(params[:id])
        if logged_in? && @user === current_user
            erb :'users/user_page'
        else 
            redirect '/not_authorized'
        end 
    end 

    post "/user/:id" do 
        @user = User.find(params[:id])
        if !params[:post_body].empty?
            @user.posts << Post.create(:post_body => params[:post_body], :post_img => params[:post_img], :post_desc => params[:post_desc])
        end 
        redirect "/user/#{@user.id}"
    end 
end 