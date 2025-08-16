def main [] {
  let queueSize: int = open config.toml | get default.queue-size
  cd ~/images/wallpapers
  fetch-new
  print $"(count-all) of ($queueSize)"
  remove-all-but-most-recent $queueSize
}

def fetch-new [] {
  wallpaper-binge
}

def count-all [] {
  ls | length
}

def remove-all-but-most-recent [n: int] {
  ls | sort-by modified | reverse | skip $n | each { rm $in.name } | ignore  
}
