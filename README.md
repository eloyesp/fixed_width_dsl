# Fixed Width DSL

A DSL to build format strings like `%-20s%010d` used for sprintf/format and
scanf making it more readable and easy to use.

```ruby
sample_format = FormatDSL.define do
  field :name, 20, :string, '-'
  field :amount, 10, :integer, '0'
end

sample_format.format_string # => '%-20s%010d'
sample_format.debug # =>
field  | width | from | to | type    | flags
name   |    20 |    1 | 20 | string  | -
amount |    10 |   21 | 30 | integer | 0

sample_format.apply(name: 'roberto', amount: 12) # =>
roberto            00000000012
sample_format.parse('Juan carlos        00000000012') # =>
{ name: 'Juan carlos',
  amount: 12 }
```
