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

  get "/articles/:id/comments" do
    article = Article.find(params[:id])
    comments = article.comments
    comments.to_json
  end

  delete "/articles/:id" do
    article = Article.find(params[:id])
    article.destroy
    article.to_json
  end

  patch "/articles/:id" do
    article = Article.find(params[:id])
    article.update(
      body: params[:body]
    )
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

  post '/articles/:id/comments' do
    
    article = Article.find(params[:id])
    comment = article.comments.build(user: params[:user], comment: params[:comment])
    
    if comment.save
      comment.to_json
    else
      { error: "Unable to create comment" }.to_json
    end
  end

end
