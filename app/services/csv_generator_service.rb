class CsvGeneratorService
  attr_accessor :collection

  def initialize(collection)
    @collection = collection
  end

  def call
    CSV.generate(headers: true) do |csv|
      csv << collection.attributes

      collection.all.each do |record|
        csv << record.attributes.values_at(*collection.attributes)
      end
    end
  end
end
