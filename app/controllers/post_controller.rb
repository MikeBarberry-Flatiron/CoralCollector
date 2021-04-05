class PostController < ApplicationController
    get "/post/:id" do 
        @post = Post.find(params[:id])
        if current_user.posts.include?(@post)
            erb :'/posts/post_page'
        else 
            redirect "/not_authorized"
        end 
    end 

    patch '/post/:id' do 
        @post = Post.find(params[:id])
        @post.update(post_body: params["edit_body"], post_img: params["edit_img"], post_desc: params["edit_desc"])

        redirect "/user/#{current_user.id}"
    end 

    delete '/post/:id' do 
        @post = Post.find(params[:id])
        @post.delete 

        redirect "/user/#{current_user.id}"
    end   
end 
