require_relative "../views/terminal.rb"
require_relative "../models/Task.rb"

class TodoController
    include TerminalView

    def initialize(repository)
        @repository = repository
    end

    def create_todo
        task = Task.new("Task 1", "This is a task")
        data = task.get_task

        @repository.save(data)
        render_message("#{data[:description]} successfully created...", "success")
    end

    def list_todos 
        render_message("Listing todos...", "success")
    end

    def update_todo
        render_message("Updating todo...", "success")
    end

    def delete_todo
        render_message("Deleting todo...", "success")
    end

    def mark_todo
        render_message("Marking todo...", "success")
    end

    def quit
        render_message("Good Bye!", "success")
    end
end