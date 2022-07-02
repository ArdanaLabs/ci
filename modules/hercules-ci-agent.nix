{ config, inputs, ... }:
{
  services.hercules-ci-agents."ardana-hetzner-ax101" = {
    settings = {
      clusterJoinTokenPath = config.age.secrets.ardanaHerculesClusterJoinToken.path;
      binaryCachesPath = config.age.secrets.ardanaHerculesBinaryCaches.path;
      secretsJsonPath = config.age.secrets.ardanaHerculesSecrets.path;
    };
  };

  age.secrets = {
    ardanaHerculesClusterJoinToken = {
      file = "${inputs.self}/secrets/ardanaHerculesClusterJoinToken.age";
      group = "hci-ardana-hetzner-ax101";
      owner = "hci-ardana-hetzner-ax101";
    };
    ardanaHerculesBinaryCaches = {
      file = "${inputs.self}/secrets/ardanaHerculesBinaryCaches.age";
      group = "hci-ardana-hetzner-ax101";
      owner = "hci-ardana-hetzner-ax101";
    };
    ardanaHerculesSecrets = {
      file = "${inputs.self}/secrets/ardanaHerculesSecrets.age";
      group = "hci-ardana-hetzner-ax101";
      owner = "hci-ardana-hetzner-ax101";
    };
  };

}
