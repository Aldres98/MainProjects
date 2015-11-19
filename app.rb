require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end


get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phonenumber = params[:phone]
	@dateandtime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = { :username => 'Введите имя', 
		:phone => 'Введите номер телефона', 
		:datetime => 'Введите дату и время' }

		# Для каждой пары ключ\значение

	#	hh.each do |key, value|
	#		if params[key] == ''
	#			# Если параметр пуст, то присвоить еррору сообщение об ошибке из хеша
	#			@error = hh[key]
	#			return erb :visit
	#		end

	#		if params[key] != ''
	#			return erb :visit
	#		end

	#	end

		@error = hh.select {|key, _| params[key] == ""}.values.join(", ")

		if @error != ''
			return erb :visit
		end


	f = File.open './public/users.txt', 'a'
	f.write "Visitors name: #{@username}\n"
	f.write "Visitors phone number: #{@phonenumber}\n"
	f.write "Time of visit : #{@dateandtime}\n"
	f.write "Selected barber: #{@barber}\n"
	f.write "Color: #{@color}\n"
	f.write "=====================\n"
	f.close
	erb "Okay, #{@username} you are going to visit us on #{@dateandtime}"



end
