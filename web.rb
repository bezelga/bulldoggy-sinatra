require 'bulldoggy'
require 'sinatra'

get '/' do
  @tasks = Bulldoggy.fetch
  erb :index
end

get '/add_task/:description' do
  task = Bulldoggy.add_task params[:description]
  "task added: #{task.id}"
end

post '/tasks' do
  Bulldoggy.add_task params[:description]
end

patch '/tasks/:id/check' do
  Bulldoggy.check_task(params[:id])
end

patch '/tasks/:id/uncheck' do
  Bulldoggy.uncheck_task(params[:id])
end

delete '/tasks/:id' do
  Bulldoggy.remove_task(params[:id])
end
