module CzPayrollee5
  class PayrollResult
    attr_reader :article_code, :concept_code, :concept

    def initialize(article_code, concept_code, concept)
      @article_code = article_code
      @concept_code = concept_code
      @concept = concept
    end

    def result_values
      []
    end

    def summary_for_code?(code)
      summary_codes = @concept.summary_articles.map {|x| x.code}
      summary_codes.include?(code)
    end
  end
end

