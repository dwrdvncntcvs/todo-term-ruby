class TaskRepository
    private attr_reader :datastore

    def initialize(name, datastore)
        @datastore = datastore
        @name = "#{name}s"
    end 

    def save(task)
        @datastore.create(@name, task)
    end

    def get_all
        @datastore.read(@name)
    end
end