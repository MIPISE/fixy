module Fixy
  module Decorator
    class Csv
      class << self
        def document(document)
          document
        end

        def field(value, record_number, position, method, length, type)
          "#{method};#{value};"
        end

        def record(record)
          record.sub(/;$/, "")
        end
      end
    end
  end
end
