require 'logger'

module CzPayrollee5
  class ResultsLogger
    def self.log_collection(results, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      results.each do |result_key, result|
        line_definition = "\n"

        line_definition += self.log_term_order_info(result_key)

        line_definition += self.log_result_info(result)

        log.info("#{line_definition}")
      end

      log.info('--- end ---')
    end

    def self.log_term_order_info(result_key)
      line_definition = "\t#{result_key.contract_order} - #{result_key.position_order} - #{result_key.period_base} " +
          "| #{result_key.code} - #{result_key.code_order}\t"

      return line_definition
    end

    def self.log_result_info(result)
      line_definition = "#{result.concept.description} - #{result.article_code}"

      line_definition += self.log_spec_values_info(result)

      return line_definition
    end

    def self.log_spec_values_info(result)
      line_definition = ''

      result_values = result.result_values

      result_values.each do |fact|
        result_value = result.send(fact)

        line_definition += "\n\t\t#{fact} - #{result_value}"
      end

      return line_definition
    end
  end
end
