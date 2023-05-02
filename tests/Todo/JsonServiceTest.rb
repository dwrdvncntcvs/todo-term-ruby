require "minitest/autorun"
require_relative "../../src/Todo/services/JsonFileService.rb"
require_relative "../../src/Todo/models/Task.rb"

class JsonServiceTest < Minitest::Test
    FILE_NAME= "../data_test.json"

    def setup 
        @jsonService = JsonFileService.new(FILE_NAME)
        @jsonService.add_key_value("tasks", [])
    end

    def teardown
        @jsonService.reset_json_data
    end

    def test_add_key_value_in_json
        puts "Test for adding key value in JSON"
        @jsonService.add_key_value("sample", [])

        assert_equal @jsonService.read("sample"), []
    end

    def test_create_task_data_in_sample_json
        puts "Test for creating task data in JSON"
        task = Task.new("Sample Task", false).get_task
        @jsonService.create("tasks", task)

        assert_equal @jsonService.read("tasks").length, 1
    end

    def test_read_data_from_sample_json
        puts "Test for reading data from JSON"
        @jsonService.add_key_value("tasks", [])
        @jsonService.create("tasks", Task.new("Sample Task", false).get_task)
        @jsonService.create("tasks", Task.new("Sample Task 2", false).get_task)

        tasks = @jsonService.read("tasks")
        
        assert_equal tasks.length, 2
        assert_equal tasks[0]["description"], "Sample Task"
        assert_equal tasks[1]["description"], "Sample Task 2"
    end

    def test_read_specific_data_from_sample_json
        puts "Test for reading specific data from JSON"
        @jsonService.add_key_value("tasks", [])
        task = Task.new("Sample Task", false).get_task
        @jsonService.create("tasks", task)

        task_id = task[:id]

        task = @jsonService.read_specific_data("tasks", task)

        assert_equal task["id"], task_id
    end

    def test_update_data_from_sample_json
        puts "Test for updating data from JSON"
        @jsonService.add_key_value("tasks", [])
        task = Task.new("Sample Task", false).get_task
        @jsonService.create("tasks", task)
        task_id = task[:id]
        task[:description] = "Sample Task Update"

        @jsonService.update("tasks", task)
        
        updated_task = @jsonService.read_specific_data("tasks", {id: task_id})

        assert_equal updated_task["id"], task_id
    end

    def test_delete_data_from_sample_json
        puts "Test for updating data from JSON"

        @jsonService.add_key_value("tasks", [])
        task1 = Task.new("Sample Task", false).get_task
        task2 = Task.new("Sample Task 2", false).get_task
        @jsonService.create("tasks", task1)
        @jsonService.create("tasks", task2)
        task_to_delete = @jsonService.read_specific_data("tasks", task1)
        
        @jsonService.delete("tasks", task_to_delete)

        assert_equal @jsonService.read("tasks").length, 1
    end
end