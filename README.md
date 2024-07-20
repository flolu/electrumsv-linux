# ElectrumSV for Linux

## Notes

- Your wallets will be stored in the `~/.electrum-sv` directory
- This won't work on most Virtual Machines!
- This script currently uses ElectrumSV v1.3.16
- This script is relying on the official ElectrumSV source code: https://github.com/electrumsv/electrumsv

## Install

- Download this repository
- Open a terminal in the repository directory
- [Install Docker](https://docs.docker.com/engine/install) by following the instructions for your distribution. Scripts for Ubuntu and Fedora are included in this repository:
  - `sudo ./docker/ubuntu.sh` ([Ubuntu](https://docs.docker.com/engine/install/fedora/#install-using-the-repository))
  - `sudo ./docker/fedora.sh` ([Fedora](https://docs.docker.com/engine/install/fedora/#install-using-the-repository))
- Reboot your computer
- Run `./install-electrum-sv.sh`

## Launch

- Run `./launch-electrum-sv.sh`

## Uninstall

- Stop ElectrumSV if it's still running
- Run `./uninstall-electrum-sv.sh`
- Optionally delete the `~/.electrum-sv` directory, which contains your wallet files
