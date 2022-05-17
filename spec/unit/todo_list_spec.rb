require 'todo_list'

RSpec.describe TodoList do
  todo_list = TodoList.new
  it 'adds a todo item' do
    todo_list.add('Walk the dog')
    expect(todo_list.all).to eq [
      'Walk the dog'
    ]
  end

  it 'gets a todo item' do
    todo_list.add('Walk the cat')
    expect(todo_list.get(1)).to eq 'Walk the cat'
  end

  it 'should update a todo item' do
    todo_list.update(1, 'Walk the hamster')
    expect(todo_list.all).to eq [
      'Walk the dog',
      'Walk the hamster'
    ]
  end
  
  it 'should remove an item' do
    todo_list.add('Walk the frog')
    todo_list.remove(0)
    expect(todo_list.all).to eq [
      'Walk the hamster',
      'Walk the frog'
    ]
  end
    
  it 'should remove all items' do
    todo_list.remove_all
    expect(todo_list.all).to eq []
  end
end
