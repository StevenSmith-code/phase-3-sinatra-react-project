class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    articles = Article.all
    articles.to_json
  end

  get "/articles/:id" do
    article = Article.find(params[:id])
    article.to_json
  end

  destroy "/articles/:id" do
    article = Article.find(params[:id])
    article.destroy
    article.to_json
  end

  post "/create_blog" do
    article = Article.create(
      author: params[:author],
      title: params[:title],
      body: params[:body]
    )
    article.to_json
  end

end
