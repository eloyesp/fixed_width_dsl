# Fixed Width DSL

A DSL to build format strings like `%-20s%010d` used for sprintf/format and
scanf making it more readable and easy to use.

## Usage

```ruby
sample_format = FixedWidthDSL.define do
  field :name, 20, :string, '-'
  field :amount, 10, :integer, '0'
end

sample_format.format_string # => '%-20s%010i'
sample_format.debug # =>
# field                | wi | fro |  to | type    | flags
# name                 | 20 |   1 |  20 | string  |   -
# amount               | 10 |  21 |  30 | integer |   0

sample_format.apply(name: 'roberto', amount: 12) # =>
# roberto             0000000012

# not yet implemented

sample_format.parse('Juan carlos        00000000012') # =>
{ name: 'Juan carlos',
  amount: 12 }
```

## Alternatives

There are some alternative gems to handle fixed width files:

 - [Fixy][1]: It may be bettter suited for complex documents where there are
   different kind of records in the same file, the syntax can be too verbose.

 - [slither][2]: Also for more complex documents, also adds some validations
   and clear error messages.
 
  [1]: https://github.com/Chetane/fixy
  [2]: https://github.com/ryanwood/slither

# License

Copyright (C) 2016  Eloy Espinaco

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
