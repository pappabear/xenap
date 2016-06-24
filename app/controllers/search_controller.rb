class SearchController < ApplicationController


  def search
    if params[:q].nil?
      @stamps = []
    else
      @stamps = Stamp.search params[:q]
    end
  end


end
