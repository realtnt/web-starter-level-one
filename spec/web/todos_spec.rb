RSpec.describe 'Todos List Web Resource' do 
  it 'lists out an empty todo list' do
    get '/todos'
    expect(last_response.body).to eq(
      "You have no tasks to do.\n"
    )
  end

  it 'adds a todo item and lists it' do
    post '/todos', task: 'walk the dog'
    expect(last_response.body).to eq(
      "walk the dog\n"
    )
  end

  context 'Adding multiple todos and listing them' do
    it 'should return a list of todos' do
      post '/todos', task: 'walk the dog'
      post '/todos', task: 'walk the cat'
      post '/todos', task: 'walk the frog'
      get '/todos'
      expect(last_response.body).to eq(
        "1. walk the dog\n2. walk the cat\n3. walk the frog\n"
      )
    end
  end

  context 'Adding multiple todos, deleting and updating' do
    it 'should return the todo being deleted' do
      post '/todos', task: 'walk the dog'
      post '/todos', task: 'walk the cat'
      post '/todos', task: 'walk the frog'
      delete '/todos/1'
      expect(last_response.body).to eq(
        "Removed: walk the dog.\n"
      )
    end
    it 'should return a list of todos' do
      post '/todos', task: 'walk the dog'
      post '/todos', task: 'walk the cat'
      post '/todos', task: 'walk the frog'
      delete '/todos/1'
      get '/todos'
      expect(last_response.body).to eq(
        "1. walk the cat\n2. walk the frog\n"
      )
    end
    it 'should return the updated todo' do
      post '/todos', task: 'walk the dog'
      post '/todos', task: 'walk the cat'
      post '/todos', task: 'walk the frog'
      patch '/todos/1', task: 'walk the fish'
      expect(last_response.body).to eq(
        "Updated: walk the fish.\n"
      )
      get '/todos'
      expect(last_response.body).to eq(
        "1. walk the fish\n2. walk the cat\n3. walk the frog\n"
      )
    end
  end
  context 'Trying to delete or update non-existent tasks' do
    it 'should return no tasks removed' do
      delete '/todos/1'
      expect(last_response.body).to eq(
        "Four - Oh no - four! Task does not exist!\n"
      )
      expect(last_response.status).to eq 404
    end
    it 'should return no tasks updated' do
      patch '/todos/1', task: 'walk the fish'
      expect(last_response.body).to eq(
        "Four - Oh no - four! Task does not exist!\n"
      )
      expect(last_response.status).to eq 404
    end
  end

  it 'should return walk the dog' do
    post '/todos', task: 'walk the dog'
    post '/todos', task: 'walk the cat'
    post '/todos', task: 'walk the frog'
    get '/todos/1'
    expect(last_response.body).to eq(
      "walk the dog\n"
    )
  end

  it 'should delete all tasks' do
    post '/todos', task: 'walk the dog'
    post '/todos', task: 'walk the cat'
    post '/todos', task: 'walk the frog'
    post '/todos/all'
    expect(last_response.body).to eq "Removed all tasks.\n"
    get '/todos'
    expect(last_response.body).to eq "You have no tasks to do.\n"
  end
end
