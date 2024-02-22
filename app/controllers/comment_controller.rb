class CommentController < ApplicationController
    def create
        item = Comment.create(
            comment: params[:comment][:comment],
            film_id: @current_film,
            user_id: @current_user
        )
        redirect_to :new, notice: 'Комментарий добавлен!'
    end

    def new
        @comment = Comment.new
    end
end
