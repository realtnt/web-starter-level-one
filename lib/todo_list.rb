class TodoList
  def initialize
    @tasks = []
  end

  def has?(index)
    return (0...@tasks.length).include?(index)
  end

  def all
    return @tasks
  end

  def add(task)
    @tasks << task
    return task
  end

  def get(index)
    return @tasks[index]
  end

  def update(index, updated_task)
    @tasks[index] = updated_task
    return updated_task
  end

  def remove(index)
    return @tasks.delete_at(index)
  end

  def remove_all
    @tasks = []
  end
end
