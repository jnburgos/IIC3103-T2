module Api
  module V1
    class ArticlesController < ApplicationController
      include ActionView::Helpers::TextHelper

      def index
        @articles = Article.order('created_at DESC');
        # @articles = @articles.map {|article| article.cuerpo.truncate(5)}
        @articles.each do |article|
          article.cuerpo = article.body.truncate(5)
        end

        render json: {status: 'SUCCESS', message:'Loaded article', data:@articles},status: :ok



        # respond_to do |format|
        #   format.json  {render json: @articles}
        # end
      end

      def show
        @article = Article.find(params[:id])
        puts 'miau'
        render json: {status: 'SUCCESS', message:'Loaded article', data:@article},status: :ok

      end

      def create
        article = Article.new(article_params)

        if article.save
          render json: {status: 'SUCCESS', message:'Saved article', data:article},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not saved', data:article.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @articles = Article.find(params[:id])
        @articles.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data:@articles},status: :ok
      end

      def update
        @articles = Article.find(params[:id])
        if @articles.update_attributes(article_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:@articles},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:@articles.errors},status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :subtitle, :body)
      end

      def set_article
        @article = Article.find(params[:id])
        @comentarios = Comentario.where(post_id:@article.id)
      end

    end
  end
end
