let
  systems = {
    ardana-ax101 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfZU658BwNVcxAb4MDjfiu8iQIbLz/mBc5UdhC5sGNd";
  };
  users = {
    marijan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAtLW0s97pM4VMf6iZlGF0hs5lSuJycmJTrTDdaFxAqi";
  };
in
{
  "ardanaHerculesSecrets.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
  "ardanaHerculesClusterJoinToken.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
  "ardanaHerculesBinaryCaches.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
}
