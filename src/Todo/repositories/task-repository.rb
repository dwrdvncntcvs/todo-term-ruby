class TaskRepository
    private attr_reader :datastore

    def initialize(name, datastore)
        @datastore = datastore
        @name = "#{name}s"
    end 

    def save(task)
        @datastore.create(@name, task)
    end

    def find_all
        @datastore.read(@name)
    end

    def find_by_id(id)
        @datastore.read_specific_data(@name, { id: id })
    end

    def complete_task(task_data)
        task_data["is_done"] = true
        @datastore.update(@name, task_data)
    end

    def update(data)
        @datastore.update(@name, data)
    end

    def delete(data)
        @datastore.delete(@name, data)
    end
end