require 'bulldoggy'
require 'sinatra'

get '/' do
  @tasks = Bulldoggy.fetch
  erb :index
end

post '/tasks' do
  Bulldoggy.add_task params[:description]
  redirect to('/')
end

patch '/tasks/:id/check' do
  Bulldoggy.check_task(params[:id].to_i)
end

patch '/tasks/:id/uncheck' do
  Bulldoggy.uncheck_task(params[:id].to_i)
end

delete '/tasks/:id' do
  Bulldoggy.remove_task(params[:id].to_i)
end
