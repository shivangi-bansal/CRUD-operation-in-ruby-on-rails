class PostsController < ApplicationController

    def index
        @post = Post.all
    end


    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        byebug
        @post = Post.find(params[:id])
        if (@post.update_attributes(post_params))
            redirect_to @post
        else
            render 'edit'
    end
end

     def destroy
        @post = Post.find(params[:id])

        @post.destroy
        redirect_to posts_path
    end



    def new
    end

    def create
        byebug
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
          else
            render 'new'
          end    
    end

    private def  post_params
        params.require(:post).permit(:name, :description)

end
end