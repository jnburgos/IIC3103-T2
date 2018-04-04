module Api
  module V1
    class ArticlesController < ApplicationController
      include ActionView::Helpers::TextHelper

      def index
        @articles = Article.order('created_at DESC');
        # @articles = @articles.map {|article| article.cuerpo.truncate(5)}
        @articles.each do |article|
          article.body = article.body.truncate(500)
        end

        render json: { "error": "Not found" }, status: :not_found unless @articles
        render json: @articles, status: :ok if @articles
      end

      def show
      @article = Article.find_by(id: params[:id])
      render json: { "error": "Not found" }, status: :not_found unless @article
      render json: @article, status: :ok if @article
      end

      def create
        @article = Article.new(article_params)

        if @article.save
          render json: @article,status: :created
        else
          render json: @article.errors,status: :unprocessable_entity
        end
      end

      def destroy
        @articles = Article.find(params[:id])
        @articles.destroy
        render json: @articles,status: :ok
      end

      def update
        @articles = Article.find(params[:id])

        if @articles.update_attributes(article_params)
          render json: @articles,status: :ok
        else
          render json: @articles.errors,status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :subtitle, :body)
      end

      def set_article
        article = Article.find(params[:id])
        comentarios = Comentario.where(post_id:article.id)
      end

    end
  end
end
