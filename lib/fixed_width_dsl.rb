module FixedWidthDSL
  class FormatString
    Field = Struct.new(:name, :width, :type, :flags)

    attr_reader :format_string

    def initialize
      @fields = []
      @format_string = ''
    end

    def debug
      output = "field                | wi | fro |  to | type    | flags\n"
      lines = [] 
      current_column = 1
      @fields.each do |field|
        end_column = current_column + field.width - 1
        output.concat format "%-20s | %2i | %3i | %3i | %-7s | %3s\n",
          field.name,
          field.width,
          current_column,
          end_column,
          field.type,
          field.flags
        current_column += field.width
      end
      output
    end

    def apply attributes
      values = @fields.map do |field|
        attributes.fetch(field.name)
      end
      format(format_string, *values)
    end

    private

    def field name, width, type, flags = ''
      type_code = case type
                  when :string then 's'
                  when :integer then 'i'
                  else raise ArgumentError, "Invalid type #{ type }"
                  end
      @format_string += "%#{ flags }#{ width }#{ type_code }"
      @fields << Field.new(name, width, type, flags)
    end
  end

  def self.define &block
    format_string = FormatString.new
    format_string.instance_eval &block
    format_string
  end
end
