module Fixy
  class Document
    attr_accessor :content, :decorator

    def generate_to_file(path, decorator: Fixy::Decorator::Default)
      File.open(path, 'w') do |file|
        file.write(generate(decorator))
      end
    end

    def generate(decorator = Fixy::Decorator::Default)
      @decorator = decorator
      @content = ''

      # Generate document based on user logic.
      build

      decorator.document(@content)
    end

    private

    def build
      raise NotImplementedError
    end

    def prepend_record(record)
      @content = record.generate(decorator) << @content
    end

    def append_record(record)
      @content << record.generate(decorator)
    end

    def parse_record(klass, record)
      @content << klass.parse(record, decorator)[:record]
    end
  end
end
