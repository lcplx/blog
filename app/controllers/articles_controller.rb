class ArticlesController < ApplicationController
    def new
        @article =Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article=Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
        
        #render plain: params[:article].inspect
    end
    
    private def article_params
        params.require(:article).permit(:title,:text)
    end
    
    def show
        @article=Article.find((params[:id]))
        
    end

    def index
        @articles=Article.all
        
    end
    
    
end
