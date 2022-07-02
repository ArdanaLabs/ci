# CI

The machine that runs our Hercules-CI Agents, defined as `nixosConfigurations.ardana-ax101` in a flake.nix

Currently Responsible: Yusuf Bera Ertan (yusuf.bera.ertan@platonic.systems)
Formerly Responsible: Matthew Croughan (matt@croughan.sh)

## Deploy with Nix

Ensure you have the ability to clone the git repos in the `inputs` of the
`flake.nix`. Also ensure you're able to connect to the `deploy` user on the
server via `ssh`, then run `nixinate` as follows:

```
nix run .#apps.nixinate.ardana-ax101
```

# Notes

The CI Machine is running on a [Hetzner AX101](https://www.hetzner.com/dedicated-rootserver/ax101) dedicated machine. The specs are as follows:

- CPU: AMD Ryzen™ 9 5950X
- RAM: 128 GB DDR4 ECC
- Disk: 2 x 3.84 TB NVMe SSD (ZFS Mirror)

Access to the Hetzner Robot admin interface can be granted by Isaac Shapira (isaac.shapira@platonic.systems)

