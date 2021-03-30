require "rest-client"

class Api::StocksController < ApplicationController

  # Not sure what to do for search?
  def index
    p params[:search]
    search_query = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{params[:search]}&apikey=EU18KIHPYJ49OM7D"
    search_query_response = RestClient.get search_query, { accept: :json }
    search_query_response_json = JSON.parse (search_query_response)

    stockNameConst = search_query_response_json["bestMatches"][0]["2. name"]
    p stockNameConst
    stockSymbolConst = search_query_response_json["bestMatches"][0]["1. symbol"]
    p stockSymbolConst

    price_query = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{stockSymbolConst}&apikey=EU18KIHPYJ49OM7D"
    price_query_response = RestClient.get price_query, { accept: :json }
    price_query_response_json = JSON.parse (price_query_response)

    stockDataResponse = [stockSymbol: stockSymbolConst, stockName: stockNameConst, stockPrice: price_query_response_json]
    p stockDataResponse

    render json: { data: price_query_response_json }
  end
end
