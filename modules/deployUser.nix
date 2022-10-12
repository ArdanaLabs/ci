let
  keys = import ./keys.nix;
in
{
  nix.settings.trusted-users = [ "deploy" ];
  security.sudo.extraRules = [{
    users = [ "deploy" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];
  users = {
    users = {
      deploy = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = keys.yusdacra ++ keys.marijan;
      };
    };
  };
}
