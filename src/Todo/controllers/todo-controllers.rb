require_relative "../views/terminal.rb"

class TodoController
    include TerminalView

    def create_todo
        render_message("Creating todo...", "success")
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
end