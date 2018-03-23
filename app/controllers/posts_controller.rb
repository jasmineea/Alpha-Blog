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
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post was successfully updated"
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end
    
    def index
        @post = Post.all
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "Post was successfully deleted"
        redirect_to posts_path
    end
    

    
    private
    
    def post_params
    params.require(:post).permit(:title, :description)
    end
    
    
end