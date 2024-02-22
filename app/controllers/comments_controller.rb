class CommentsController < ApplicationController
    def create
        debugger
        item = Comment.create(
            comment: params[:comment][:comment],
            film_id: session[:film_id],
            user_id: session[:user_id]
        )
        flash[:notice] = 'Комментарий добавлен!'
        redirect_to films_path
    end

    def new
        @comment = Comment.new
    end
end
