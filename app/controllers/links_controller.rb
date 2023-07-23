class LinksController < ApplicationController 

    def new
        @link = Link.new
    end
    
    def show
        @link = Link.find(params[:id])
    end
    
    def create
        shortener = Shortener.new(link_params[:original_url])
        @link = shortener.generate_short_link
        if @link.save
            redirect_to @link, notice: "Link generated", allow_other_host: true
        else
            render :new, status: :unprocessable_entity
        end
    end

    
    

    private

    def link_params
        params.require(:link).permit(:original_url)
    end
    
    
end