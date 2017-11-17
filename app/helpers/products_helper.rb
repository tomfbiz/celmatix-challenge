# Helper module for +Product+ related stuff
module ProductsHelper
  # Formats a number with 2 digits precision, for displaying currency amounts
  def pretty_number(number)
    number_with_precision(number, precision: 2)
  end
end
