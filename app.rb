# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'
require 'todo_list'

class WebApplicationServer < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    # This sets up the right content type for plain text responses
    content_type 'text/plain'
    $global ||= {}
  end

  def todo_list
    return $global[:todo_list] ||= TodoList.new
  end

  get '/todos' do
    todo_list.has?(1)
    return "You have no tasks to do.\n" if todo_list.all.empty?
    return todo_list.all.map.with_index(1) { |todo, i| "#{i}. #{todo}\n" }
  end

  get '/todos/:id' do
    task_index = params[:id].to_i - 1
    return "#{todo_list.get(task_index)}\n" if todo_list.has?(task_index)
    status 404
    return "Four - Oh no - four! Task does not exist!\n"
  end

  post '/todos' do
    task_name = todo_list.add(params[:task])
    return "#{task_name}\n"
  end

  delete '/todos/:id' do
    task_index = params[:id].to_i - 1
    return task_not_found! unless todo_list.has?(task_index)
    task_name = todo_list.remove(task_index) 
    return "Removed: #{task_name}.\n"
  end

  patch '/todos/:id' do
    task_index = params[:id].to_i - 1
    return task_not_found! unless todo_list.has?(task_index)
    task_name = todo_list.update(task_index, params[:task])
    return "Updated: #{task_name}.\n"
  end

  post '/todos/all' do
    todo_list.remove_all
    return "Removed all tasks.\n"
  end

  def task_not_found!
    status 404
    return "Four - Oh no - four! Task does not exist!\n"
  end
end

# curl localhost:9292/todos
# curl -X DELETE localhost:9292/todos/2
# curl -X POST -d 'task=walk the frog' localhost:9292/todos
# curl -X PATCH -d 'task=walk the fish' localhost:9292/todos/1
