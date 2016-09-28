require_relative '../lib/fixed_width_dsl'

sample_format = FixedWidthDSL.define do
  field :name,   20, :string,  '-'
  field :age,     2, :integer, '0'
  field :amount, 10, :integer, '0'
end

assert_equal sample_format.format_string, '%-20s%02i%010i'

assert_equal sample_format.debug, <<DEBUG
field                | wi | fro |  to | type    | flags
name                 | 20 |   1 |  20 | string  |   -
age                  |  2 |  21 |  22 | integer |   0
amount               | 10 |  23 |  32 | integer |   0
DEBUG

assert_equal sample_format.apply(name: 'roberto', age: 18, amount: 12), <<FORMATTED.chomp
roberto             180000000012
FORMATTED
