require 'json'

class DataServiceMock
  def initialize(data = {})
    @data = data
  end

  def create(key, dataToSave)
    @data[key] << dataToSave
  end

  def read(key)
    @data[key]
  end

  def read_specific_data(key, data)
    parse_data(key).find { |item| item["id"] == data[:id] }
  end

  def update(key, updateData)
    new_data = parse_data(key).map { |item| item['id'] == updateData['id'] ? updateData : item }
    @data[key] = new_data
  end

  def delete(key, deleteData)
    new_data = parse_data(key).filter { |item| item['id'] != deleteData['id'] }
    @data[key] = new_data
  end

  def reset_json_data
    @data = {}
  end

  private

  def parse_data(key)
    JSON.parse(@data[key].to_json)
  end
end
