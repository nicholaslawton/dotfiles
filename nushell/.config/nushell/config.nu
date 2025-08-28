def pwd-collapsed [] { pwd | str replace --regex $'^($env.HOME)' '~' }
def date-simple [] { date now | format date '%d %b, %H:%M:%S' }

def transient-prompt-status-style [] {
  let success = { fg: '#333333', bg: '#00ff00' }
  let failure = { fg: '#333333', bg: '#ff0000' }
  if ($env.LAST_EXIT_CODE == 0) { $success } else { $failure }
}
def transient-prompt-status-indicator [] {
  let success = "tick-glyph"
  let failure = "cross-glyph"
    if ($env.LAST_EXIT_CODE == 0) { $success } else { $failure }
}

$env.PROMPT_COMMAND = {|| pwd-collapsed | append ' ' }
$env.PROMPT_INDICATOR = '❯ '
$env.PROMPT_INDICATOR_VI_NORMAL = '❯ '
$env.PROMPT_COMMAND_RIGHT = {|| date-simple }

$env.config.render_right_prompt_on_last_line = true

$env.TRANSIENT_PROMPT_COMMAND = {||
  pwd-collapsed
  | fill --width 40 --alignment l
  | prepend (ansi { fg: '#ffffff', bg: '#0000ff' })
  | append (ansi reset)
  | append "\n" }
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = {||
  date-simple
  | fill --width 20 --alignment r
  | prepend (ansi (transient-prompt-status-style))
  | append (ansi reset)
  | prepend (transient-prompt-status-indicator)
  | str join ' ' }
