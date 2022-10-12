let
  systems = {
    ardana-ax101 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfZU658BwNVcxAb4MDjfiu8iQIbLz/mBc5UdhC5sGNd";
  };
  users = {
    yusdacra = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUeDBW4hnHgnT0SjVFeGDztht9owObSmiyWXmmIEGQp2IMPqFpCxkOU61osvfCf4ZT92Ok9iJTohLwFBvHJRD/+CH8/b54sgFAx1lLObkJOMLz4iWZ5y4fNtBYuIA2McQSQoMDpDz6TDym7v7HF7zoUyBmfHMT/9WiX/z6Ft9hY63eh9DcF7WVURzeUvXLApt9wUYUxxdC2KZ/VrDPrIOxCcOgj3le+1zTiD8zwfAGhkzRD3IEx0yCYK6oztrh6WTwA5ZW+cLziH2sVEvSHFa2O398gIvZpzsdYTcQt06d/oyZIvftcpxD8IvjpGgHEsN/mAg0ovexyqAVk+TV/1XySKaoPPVCekap0R50CVD9kEk+GlD78XBYi++aAMIq0/D+NOXkgksfODt3yJPPzQx4KH8gcn0dQJM5zeyTwDfclzMRqCwL1eVHY00EbtG9IcLmMsWk/lM6vpHfyHqHlqNJ3CnUuDBccz9p5ORC1cuj4r9CmXPPmh7OYk7gGiQb4oxuqsYClzp93qmU7qMvGwmxBJaVagNIJgBqb5fsne0OMlcer5CH4L31ozszkSkzCXtFWNoTdgQHU1J3DxxL9WQJCfKku4EPJadYOh80USnauOke5CqfsGtf6uMq4l5Ylcc1QcNhRqxpeTLAIZx0EYDhmQ4eGjAZbiv6ddUp9dAdiQ==";
    marijan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAtLW0s97pM4VMf6iZlGF0hs5lSuJycmJTrTDdaFxAqi";
  };
in
{
  "ardanaHerculesSecrets.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
  "ardanaHerculesClusterJoinToken.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
  "ardanaHerculesBinaryCaches.age".publicKeys = [ users.marijan systems.ardana-ax101 ];
}
