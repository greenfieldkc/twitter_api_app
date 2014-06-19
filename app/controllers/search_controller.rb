class SearchController < ApplicationController
  layout false
  
  def new
    @keyword       = sanitize_keyword
    @tweet_results = get_first_ten_results
    
    render :json => @tweet_results    
  end

  private
  
    def get_first_ten_results
      TWITTER_CLIENT.search(@keyword).take(10).collect do |object|
        { :tweet => object.text } if object.is_a?(Twitter::Tweet)
      end
    end
      
    def sanitize_keyword
      if params[:keyword].nil?
        raise ArgumentError
      else
        transformed_keyword = params[:keyword].gsub('"', "")
        raise ArgumentError if transformed_keyword.blank?
      end
      
      transformed_keyword
    end
  
  
  
end
