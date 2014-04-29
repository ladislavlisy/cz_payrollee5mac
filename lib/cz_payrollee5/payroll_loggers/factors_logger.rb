require 'logger'

module CzPayrollee5
  class FactorsLogger
    def self.log_collection(factors, file_name)
      log = Logger.new("#{file_name}.txt")
      log.level = Logger::INFO
      original_formatter = Logger::Formatter.new
      log.formatter = proc { |severity, datetime, prog_name, msg|
        "%s\n"  % [msg]
      }

      factors.each do |factor_key, concept|
        line_definition = "\n"

        line_definition += self.log_term_order_info(factor_key)

        line_definition += self.log_concept_info(concept)

        log.info("#{line_definition}")
      end

      log.info('--- end ---')
    end

    def self.log_term_order_info(factor_key)
      line_definition = "\t#{factor_key.contract_order} - #{factor_key.position_order} - #{factor_key.period_base} " +
          "| #{factor_key.code} - #{factor_key.code_order}\t"

      return line_definition
    end

    def self.log_concept_info(concept)
      line_definition = "#{concept.description} - #{concept.article_code}"

      line_definition += self.log_spec_values_info(concept)

      return line_definition
    end

    def self.log_spec_values_info(concept)
      line_definition = ''

      factor_values = concept.spec_values

      factor_values.each do |fact|
        fact_value = concept.send(fact)

        line_definition += "\n\t\t#{fact} - #{fact_value}"
      end

      return line_definition
    end
  end
end
