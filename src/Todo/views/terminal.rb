require "colorize"

HEADER_PAD_SIZE = 10

module TerminalView
    def render_instruction(instructions)
        instructions.each do |instruction|
            puts "#{instruction[:id]}. #{instruction[:details]}"
        end

        puts "Enter action number:"
        selected_action = gets.chomp.to_i
    end

    def render_header(content, color)
        puts ("=".*(HEADER_PAD_SIZE) + " #{content} " + "=".*(HEADER_PAD_SIZE)).colorize(color)
    end

    def render_message(content, status)
        color = :red if status == "error"
        color = :green if status == "success"
        color = :yellow if status == "warning"

        empty
        puts content.colorize(color)
        empty
    end
    
    def empty
        puts ""
    end
end
