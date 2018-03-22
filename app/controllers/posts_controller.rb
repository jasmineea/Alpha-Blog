class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    
    def create
    @post = Post.new(post_params)
    @post.save
        if @post.save
        flash[:success] = "Post was created successfully"
    redirect_to post_path(@post)
        else
            render 'new'
        end
    end
    
    def show
        @post = Post.find(params[:id])
    end
    

    
    private
    
    def post_params
    params.require(:post).permit(:title, :description)
    end
    
    
end