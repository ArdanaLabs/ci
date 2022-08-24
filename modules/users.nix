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
        hashedPassword = "$6$MskU0R2atQrmANGS$UzqlOrK1ni2EA77wM9AMmkE9XMYk5dyKmr0UW/9XQT17BIK1xDOeBudGV4rEtRBPT1PQ0F5ZxPywsuM7MaXdG/";
      };
    };
  };
}
