require_relative '../lib/fixed_width_dsl'

sample_format = FixedWidthDSL.define do
  field :name, 20, :string, '-'
  field :amount, 10, :integer, '0'
end

assert_equal sample_format.format_string, '%-20s%010i'

assert_equal sample_format.debug, <<DEBUG
field                | wi | fro |  to | type    | flags
name                 | 20 |   1 |  20 | string  |   -
amount               | 10 |  21 |  30 | integer |   0
DEBUG

assert_equal sample_format.apply(name: 'roberto', amount: 12), <<FORMATTED.chomp
roberto             0000000012
FORMATTED
