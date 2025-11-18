upower --show-info /org/freedesktop/UPower/devices/battery_BAT0
| lines
| split column ':' --number 2 key value
| str trim
| where key in ['state', 'percentage']
| reduce --fold {} {|it, acc| $acc | upsert $it.key $it.value}
| upsert percentage { str replace '%' '' | into int }
| [$in.percentage, $in.state]
| str join ' '
