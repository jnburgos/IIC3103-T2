Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :articles, path: 'news' do
        resources :comentarios, path: 'comments'
      end



    end
  end
end
