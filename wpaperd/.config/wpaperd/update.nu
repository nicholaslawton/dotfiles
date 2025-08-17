let config = open ~/.config/wpaperd/config.toml
let dir = $config.default.path | path expand
let num = $config.default.queue-size

print $"Downloading wallpaper to ($dir)"
wallpaper-binge -o $dir

let wallpapers = ls $dir | where type == file
print $"($wallpapers | length) of ($num) wallpapers"

let removals = $wallpapers | sort-by modified | reverse | skip $num
print $"Removing ($removals | length) wallpapers"
$removals | each { rm $in.name; $in }
