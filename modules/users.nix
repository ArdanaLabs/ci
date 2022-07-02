let
  keys = import ./keys.nix;
in
{
  users = {
    mutableUsers = false;
    users = {
      yusdacra = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = keys.yusdacra;
        extraGroups = [ "wheel" ];
        hashedPassword = "$6$wZnyFXlzYYB3kAQd$jNvHAUfrEsPr4ADo8yiKNWId5sBLdUIBvUY6fKCWfMglBoFX497GkU3fslZ6wLEunxvFxoxNUD1/pOdx7ZNXW1";
      };
      matthew = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = keys.matthew;
        extraGroups = [ "wheel" ];
        hashedPassword = "$6$I5AtvK7mlyMXfb/j$pZxeJXTVt5huLfBxOZB0jUFncNh/yoYr39orKn.ZJtUTpLXFRnqdZwDh3s.6zicb.BxPocRkWZYelxC8xggiS/";
      };
    };
  };
}
