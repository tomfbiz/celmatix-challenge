# Helper module for +Product+ related stuff
module ProductsHelper
  # Formats a number wiht 2 digits, for currency amounts
  def pretty_number(number)
    number_with_precision(number, precision: 2)
  end
end
