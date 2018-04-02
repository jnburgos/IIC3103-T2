module Api
  module V1
    class ComentariosController < ApplicationController

      def index
        @comentarios = Comentario.order('created_at DESC');


        render json: {status: 'SUCCESS', message: 'Loaded articles', data: @comentarios}, status: :ok
      end

      def show
        @comentario = Comentario.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded article', data:@comentario},status: :ok
      end

      def create
        comentario = Comentario.new(comentario_params)

        @article = Article.find(params[:article_id])



        comentario.article = @article
        if comentario.save
          render json: {status: 'SUCCESS', message:'Saved article', data:comentario},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not saved', data:comentario.errors},status: :unprocessable_entity
        end
      end

      def comentario_params
        params.permit(:author, :comment)
      end

    end
  end
end
