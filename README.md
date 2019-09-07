# ha_flux_led
Wraps functions from the [flux_led python utiliy](https://github.com/beville/flux_led "flux_led GitHub") into simple scripts intended for use with the [ha-bridge home automation bridge system](https://github.com/bwssytems/ha-bridge "ha-bridge GitHub").

Includes scripts for easy control of:

- Light on `lighton.sh`
- Light off `lightoff.sh`
- Light brightness `lightdim.sh`
- Light color `lightcolor.sh`

**Requires:** `flux_led` be installed for user of scripts (`root` for ha-bridge), `bc`.

## Setup with ha-bridge
This collection of scripts makes it very simple to to integrate with ha-bridge. Just create a new device with the following settings:

![ha-bridge settings](https://i.imgur.com/q1i47Vk.png "ha-bridge settings")

Make sure the type is set to `Execute Command\Script\Program` and tou click the green Add button next to each item.
