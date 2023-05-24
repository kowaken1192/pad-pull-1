class SearchesController < ApplicationController
    def search
      @area = params[:area]
      @keyword = params[:keyword]
  
      @rooms = Room.search(@area, @keyword)
    end
  end
  