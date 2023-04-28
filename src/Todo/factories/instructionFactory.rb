class InstructionFactory
    attr_reader :instructions

    def initialize()
        @instructions = []
    end
    
    def add(instruction, action)
        inst = {
            :details => instruction,
            :id => @instructions.length + 1,
            :action => action
        }

        @instructions.push(inst)
        self
    end

    def instructions
        @instructions
    end
end