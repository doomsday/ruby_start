@query1 = { data: { :$elemMatch => { value: Regexp.new('^ТОО') } } }
@query2 = { uuid: '618a22b9-a83c-4e61-b5fb-4da814e86499' }
@query3 = { :$and =>
              [
                { data: { :$elemMatch => { id: 'sum_supply' } } },
                { data: { :$elemMatch => { key: { :$gt => 5_000_000 } } } }
              ] }
@query4 = { data: {:$elemMatch => {id: 'sum_supply', key: {:$gt => 5_000_000}}}}