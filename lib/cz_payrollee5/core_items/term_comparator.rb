module CzPayrollee5
  class TermComparator
     def self.get_order(term_collection, term_group, code)
       selected_terms = self.select_equals(term_collection, term_group, code)

       one_code_orders = self.extract_code_orders(selected_terms)

       self.get_first_order_from(one_code_orders.sort)
     end

     def self.get_new_order(term_collection, term_group, code)
       selected_terms = self.select_equals(term_collection, term_group, code)

       one_code_orders = self.extract_code_orders(selected_terms)

       self.get_new_order_from(one_code_orders.sort)
     end

     def self.select_equals(term_collection, term_group, code)
       term_collection.select { |x| x.contract_order == term_group.contract_order && x.position_order == term_group.position_order && x.period_base == term_group.period_base && x.code == code }
     end

     def self.extract_code_orders(term_collection)
       term_collection.map { |x| x.code_order }
     end

     def self.get_first_order_from(sorted_order_collection)
       first_code_order = 1
       first_code_order = sorted_order_collection.first unless sorted_order_collection.first.nil?
       first_code_order
     end

     def self.get_new_order_from(sorted_order_collection)
       last_code_order = sorted_order_collection.inject(0) { |agr, x| ((x > agr) && (x - agr) > 1) ? agr : x }
       (last_code_order + 1)
     end
  end
end
