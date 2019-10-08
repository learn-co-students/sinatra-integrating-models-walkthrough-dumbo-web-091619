require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @letter = @analyzed_text.most_used_letter.keys 
    @time = @analyzed_text.most_used_letter[@letter[0]]
    erb :results
  end
end
