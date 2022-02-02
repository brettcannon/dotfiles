function tool_mapping -d "Print what an old command should be replaced with"
  set_color red
  echo -n $argv[1]
  set_color normal
  echo -n " → "
  if command --search $argv[2] > /dev/null
    set_color green
    echo $argv[2]
  else
    set_color yellow
    echo -n $argv[2]
    set_color normal
    echo "?"
  end
  set_color normal
end

function fish_greeting
  tool_mapping cd zoxide
  tool_mapping ls exa
  tool_mapping cat rich
  tool_mapping top htop
  tool_mapping du dust
  tool_mapping vim nvim
end
