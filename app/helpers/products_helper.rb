module ProductsHelper
  def pretty_number(number)
    number_with_precision(number, precision: 2)
  end
end
