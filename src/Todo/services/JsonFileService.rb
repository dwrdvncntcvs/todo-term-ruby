require "json"

class JsonFileService
    def initialize(filename)
        @filename = filename
        check_json_file
    end

    def add_key_value(key, value)
        data = get_data_key

        if !data["data"].has_key?(key)
            data["data"][key] = value
            write_file(data.to_json)
            return self
        end

        self
    end

    def create(key, dataToSave)
        data = get_data_key
        file_data = data["data"]
        file_data[key] << dataToSave
        write_file(data.to_json)
    end

    def read(key)
        data = get_data_key
        file_data = data["data"]
        file_data[key]
    end

    def read_specific_data(key, data)
        file_data = read(key)
        file_data.find { |item| item["id"] == data[:id] }
    end

    def update(key, updateData)
        data = get_data_key
        file_data = data["data"]
        new_data = file_data[key].map { |item| item["id"] == updateData["id"] ? updateData : item }
        file_data[key] = new_data
        write_file(data.to_json)
    end

    def delete(key, deleteData)
        data = get_data_key
        file_data = data["data"]
        new_data = file_data[key].filter { |item| item["id"] != deleteData["id"] }
        file_data[key] = new_data
        write_file(data.to_json)
    end

    def reset_json_data
        write_file('{ "data": {} }')
    end

    private

    def open_file
        File.open(@filename, "r+")
    end

    def write_file(data)
        File.write(@filename, data)
    end

    def check_json_file
        file = open_file

        if (file.read == "")
            write_file('{ "data": {} }')
        end
    end

    def get_data_key
        JSON.parse(open_file.read)
    end
end