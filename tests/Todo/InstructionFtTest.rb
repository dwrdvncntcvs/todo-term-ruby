require "minitest/autorun"
require_relative "../../src/Todo/factories/instructionFactory.rb"

class InstructionFactoryTest < Minitest::Test
    def setup
        @instructionFt = InstructionFactory.new
    end

    def test_create_instruction
        puts "Test for creating instruction"
        @instructionFt.add("Create Task",  Proc.new{}).add("List Task", Proc.new{})

        assert_equal @instructionFt.instructions[0][:id], 1
        assert_equal @instructionFt.instructions[0][:details], "Create Task"
        assert_equal @instructionFt.instructions.length, 2
    end
end