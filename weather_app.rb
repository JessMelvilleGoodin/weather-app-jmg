require 'sinatra'
require 'yahoo_weatherman'

def get_weather(location)
client = Weatherman::Client.new
client.lookup_by_location(location).condition['text']

end

def get_temp(location)
client = Weatherman::Client.new
client.lookup_by_location(location).condition['temp']

end

get '/' do
	"#{@message}"
	erb :index
end 

post '/weather' do
	@post = params[:post]['location']
	@weather = get_weather(@post).downcase
		@temp = (get_temp(@post)*1.8+32).to_s
	"#{@weather}"

	if (@weather == 'sunny')
		erb:sunny
	elsif (@weather =='cloudy')
		erb:cloudy
	elsif (@weather == 'mostly cloudy')
		erb :cloudy
	elsif (@weather =='rainy')
		erb :rainy
	elsif (@weather =='snowy')
		erb :snowy
	elsif (@weather == 'foggy')
		erb :foggy
	else 
		erb :otherweather
	end
	
end



	


