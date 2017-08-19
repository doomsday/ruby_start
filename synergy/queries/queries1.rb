
# Partial match queries
@query1_0 = { 'data.value' => /^ТОО/ }
@query1_1 = { 'data.value' => Regexp.new('^ТОО') }
@query1_2 = { 'data.value' => { :$regex => '^ТОО', :$options => 'i' } }

# Literal match
@query2 = { uuid: '618a22b9-a83c-4e61-b5fb-4da814e86499' }

# Querying specific ranges
@query3 = {
  data: { :$elemMatch => {
    id: 'sum_supply',
    key: { :$gte => 5_000_000, :$lte => 8_000_000 }
  } }
}

@query4 = { 'data.id' => 'sum_supply', 'data.key' => {:$gte => 5_000_000, :$lte => 8_000_000} }

# JS where
@query5 = { :$where => 'function() {return this.data.id = "sum_supply"}' }
