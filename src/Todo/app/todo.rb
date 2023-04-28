require_relative '../views/terminal.rb'
require_relative "../factories/instructionFactory.rb"
require_relative "../controllers/todo-controllers.rb"

module Todo
    class Client
        include TerminalView

        private attr_reader :instructions
        private attr_reader :is_app_running

        def initialize
            @is_app_running = true
            initialize_deps
            initialize_instructions
        end

        def start 
           while @is_app_running
                render_header("Todo App", :red)
                selected_option = render_instruction(@instructions)

                for index in 0...@instructions.length do
                    id, details, action= 
                        @instructions[index]
                            .values_at(:id, :details, :action)

                    if id == selected_option
                        action.call()
                    end
                end
            end
        end

        def quit
            @is_app_running = false
            @todo_controller.quit
        end

        private

        def initialize_deps
            @todo_controller = TodoController.new
        end

        def initialize_instructions
            instructionFt = InstructionFactory.new
            instructionFt
                .add("➕ Create New Task ", 
                    lambda { @todo_controller.create_todo })
                .add("📃 List All Tasks",
                    lambda { @todo_controller.list_todos })
                .add("✅ Mark Task as Done",
                    lambda { @todo_controller.mark_todo })
                .add("❌ Delete Task",
                    lambda { @todo_controller.delete_todo })
                .add("⭕ Quit",
                    lambda { quit })

            @instructions = instructionFt.instructions
        end
    end
end