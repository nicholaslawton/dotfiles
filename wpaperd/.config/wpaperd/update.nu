cd ~/images/wallpapers
fetch-new
remove-all-but-most-recent 24

def fetch-new [] {
  wallpaper-binge
}

def remove-all-but-most-recent [n: int] {
  ls | sort-by modified | reverse | skip $n | each { rm $in.name } | ignore  
}
