module CzPayrollee5
  class TermPartiesCollector
    def self.collect_parties_for_contract(factors)
      initial_parties = []

      contract_parties = factors.inject(initial_parties) do |agr, factor_pair|
        token = factor_pair.first
        concept = factor_pair.last
        get_contract_parties(agr, token, concept)
      end
      return contract_parties
    end

    def self.get_contract_parties(contract_parties, fact_token, concept)
      contract_party = concept.get_contract_party(fact_token)

      if contract_party.nil?
         return contract_parties.dup
      end
      contract_party_arry = [contract_party]

      return contract_parties.concat(contract_party_arry)
    end

    def self.collect_parties_for_position(factors)
      initial_parties = []

      position_parties = factors.inject(initial_parties) do |agr, factor_pair|
        token = factor_pair.first
        concept = factor_pair.last
        get_position_parties(agr, token, concept)
      end
      return position_parties
    end

    def self.get_position_parties(position_parties, fact_token, concept)
      position_party = concept.get_position_party(fact_token)

      if position_party.nil?
        return position_parties.dup
      end
      position_party_arry = [position_party]

      return position_parties.concat(position_party_arry)
    end
  end
end
