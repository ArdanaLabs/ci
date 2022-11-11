let
  systems = {
    ardana-ax101 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfZU658BwNVcxAb4MDjfiu8iQIbLz/mBc5UdhC5sGNd";
  };
  users = {
    marijan = "age1yubikey1q0tpa48d03dy59jcsjsx5a8zv0p8msr89ut7xgr64x5ujgkrn0ceulx4zwv";
  };
  allUsers = builtins.attrValues users;
in
{
  "ardanaHerculesSecrets.age".publicKeys = allUsers ++ [ systems.ardana-ax101 ];
  "ardanaHerculesClusterJoinToken.age".publicKeys = allUsers ++ [ systems.ardana-ax101 ];
  "ardanaHerculesBinaryCaches.age".publicKeys = allUsers ++ [ systems.ardana-ax101 ];
}
