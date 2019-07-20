module ConvertersBeforeValidation
  ActiveSupport.on_load(:active_record) do
    # Adds private callback before_validation, which apply necessary function
    # to attributes.
    #
    # Usage:
    #  string_converter_before_validation :camelcase, :field1, :field2, :field3
    #
    # Parameters:
    # formatter_function::
    #  Name of String functions: downcase, squish, upcase, camelcase, ...
    #  (Example: 'camelcase', :camelcase, "camelcase")
    #
    # attributes_list::
    #  List of attributes, which values will be converted with formatter_function.
    def self.string_converter_before_validation(formatter_function, *attributes_list)
      callback_name = "callback_converters_before_validation_string_#{formatter_function}"

      before_validation callback_name.to_sym

      class_eval(%(
      def #{callback_name}
      #{attributes_list.map { |aa| "    self.#{aa.to_s.squish} = #{aa.to_s.squish}.to_s.#{formatter_function};" }.join("\n")}
      end
      ))

      private callback_name.to_s
    end

    # Usage:
    #  downcase_before_validation_for :email, :login
    def self.downcase_before_validation_for(*attributes_list)
      string_converter_before_validation :downcase, *attributes_list
    end

    # Usage:
    #  squish_before_validation_for :name, :surname, :email, :login
    def self.squish_before_validation_for(*attributes_list)
      string_converter_before_validation :squish, *attributes_list
    end

    # Usage:
    #  upcase_before_validation_for :title
    def self.upcase_before_validation_for(*attributes_list)
      string_converter_before_validation :upcase, *attributes_list
    end
  end
end
