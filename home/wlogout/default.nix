{lib, ...}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "windows";
        action = "systemctl reboot --boot-loader-entry=auto-windows";
        text = "Boot to Windows";
        keybind = "w";
      }
    ];
    style =
      # css
      ''

        * {
            background-image: none;
            box-shadow: none;
        }

        window {
            background-color: rgba(30, 30, 46, 0.9);
        }

        button {
            border-radius: 5px;
            border-color: black;
            text-decoration-color: #cdd6f4;
            color: #cdd6f4;
            background-color: #1e1e2e;
            border-style: solid;
            border-width: 2px;
            border-color: #b4befe;
            margin: 20px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
        }

        button:focus, button:active, button:hover {
            background-color: #312557;
            outline-style: none;
        }
      ''
      + lib.strings.concatStrings (builtins.map (
        x: let
          url = "url(\"${./icons}/${x}.png\")";
        in ''
          #${x} {
            background-image: image(${url}, ${url});
          }
        ''
      ) ["lock" "logout" "suspend" "hibernate" "shutdown" "reboot" "windows"]);
  };
}
