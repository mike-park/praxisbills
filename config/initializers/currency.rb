# -*- coding: utf-8 -*-
module ActionView
  module Helpers
    module NumberHelper
      def number_to_currency_with_euro(number, options = {})
        defaults = {:unit => ''}
        s = ""
        s << '€' unless options[:unit]
        s << number_to_currency_without_euro(number, defaults.merge(options))
      end
      alias_method_chain :number_to_currency, :euro
    end
  end
end
