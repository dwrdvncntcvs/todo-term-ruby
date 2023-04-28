require "json"

class JsonFileService
    def initialize(filename)
        @filename = filename
        check_json_file
    end

    def add_key_value(key, value)
        data = get_data_key["data"]

        if data.has_key?(key)
            return
        else
            data["data"][key] = value
            write_file(data.to_json)
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