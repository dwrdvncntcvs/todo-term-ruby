require 'minitest/autorun'
require_relative '../../src/Todo/repositories/task-repository'
require_relative '../mocks/DataServiceMock'
require_relative '../../src/Todo/models/Task'

class TaskRepositoryTest < Minitest::Test
  def setup
    @mock_datastore = DataServiceMock.new({ 'tasks' => [] })
    @name = 'task'
  end

  def teardown
    @mock_datastore.reset_json_data
  end

  def test_save_task
    puts 'Test for saving task'
    task_repository = TaskRepository.new(@name, @mock_datastore)
    task = Task.new('Sample Task', false).get_task

    task_repository.save(task)

    assert_equal task_repository.find_all.length, 1
  end

  def test_find_all
    puts 'Test for finding all tasks'

    task_repository = TaskRepository.new(@name, @mock_datastore)
    task_repository.save(Task.new('Sample Task', false).get_task)
    task_repository.save(Task.new('Sample Task 2', false).get_task)

    assert_equal task_repository.find_all.length, 2
  end

  def test_find_by_id
    puts 'Test for finding specific task'

    task1 = Task.new('Sample Task', false).get_task
    task2 = Task.new('Sample Task 2', false).get_task
    task_repository = TaskRepository.new(@name, @mock_datastore)
    task_repository.save(task1)
    task_repository.save(task2)

    found_task = task_repository.find_by_id(task1[:id])

    assert_equal found_task['id'], task1[:id]
  end

  def test_complete_task
    puts 'Test for completing a task'

    task1 = Task.new('Sample Task', false).get_task
    task_repository = TaskRepository.new(@name, @mock_datastore)
    task_repository.save(task1)

    task_repository.complete_task(task1)

    completed_task = task_repository.find_by_id(task1[:id])

    assert_equal completed_task['is_done'], true
  end

  def test_update_task
    puts 'Test for Updating a task'

    task1 = Task.new('Sample Task', true).get_task
    task_repository = TaskRepository.new(@name, @mock_datastore)
    task_repository.save(task1)

    new_task_desc = 'Updated Task'
    task1['description'] = new_task_desc
    task1['is_done'] = false
    task_repository.update(task1)

    updated_task = task_repository.find_by_id(task1[:id])

    assert_equal updated_task['description'], new_task_desc
    assert_equal updated_task['is_done'], false
  end

  def test_delete_task
    puts 'Test for deleting a task'

    task1 = Task.new('Sample Task', true).get_task
    task2 = Task.new('Sample Task 2', true).get_task
    task_repository = TaskRepository.new(@name, @mock_datastore)
    task_repository.save(task1)
    task_repository.save(task2)
    task = task_repository.find_by_id(task1[:id])

    task_repository.delete(task)

    assert_equal task_repository.find_all.length, 1
  end
end
