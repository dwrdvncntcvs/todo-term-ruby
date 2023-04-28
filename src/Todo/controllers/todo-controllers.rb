require_relative "../views/terminal.rb"
require_relative "../models/Task.rb"

class TodoController
    include TerminalView

    def initialize(repository)
        @repository = repository
    end

    def create_todo
        clear_screen
        description, is_done = render_task_form.values_at(:description, :is_done)

        task = Task.new(description, is_done)
        data = task.get_task

        @repository.save(data)
        clear_screen
        render_message("#{data[:description]} successfully created...", "success")
    end

    def list_todos 
        clear_screen
        tasks = @repository.get_all

        render_row(["ID", "Description", "Status"])
        tasks.each do |task|
            render_row([
                task["id"], 
                task["description"], 
                task["is_done"] ? "Done" : "Pending"
            ])
        end
        empty

        render_message("All tasks successfully retrieved", "success")
    end

    def update_todo
        render_message("Updating todo...", "success")
    end

    def delete_todo
        render_message("Deleting todo...", "success")
    end

    def mark_todo
        clear_screen
        id = render_id_form
        
        data = @repository.get_by_id(id)

        if data == nil
            render_message("Task not found", "error")
            return
        end

        @repository.mark_as_done(data)

        render_message("Marking todo...", "success")
    end

    def quit
        clear_screen
        render_message("Good Bye!", "success")
    end
end