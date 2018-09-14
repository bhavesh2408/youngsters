class Worker::Importer
  class << self
    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path, :ignore => true, csv_options: {encoding: Encoding::ISO_8859_1})
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  end
end

class Worker::Importer::ImportProducts
  attr_reader :error_messages

  def initialize(file)
    @spreadsheet = Worker::Importer.open_spreadsheet(file)
    @error_messages = {}

    import
  end

  private

  def import
    @spreadsheet.each_with_index(headers: true) do |row, i|
      next if i == 0 # skip headers and empty records
      product_attributes = Product.attributes_for_import(row)
      product = Product.create(product_attributes)
    end
  end
end


class Worker::Importer::ImportEmployees
  attr_reader :error_messages

  def initialize(file)
    @spreadsheet = Worker::Importer.open_spreadsheet(file)
    @error_messages = {}

    import
  end

  private

  def import
    @spreadsheet.each_with_index(headers: true) do |row, i|
      next if i == 0 # skip headers and empty records
      employee_attributes = Employee.attributes_for_import(row)
      employee = Employee.create(employee_attributes)
    end
  end
end