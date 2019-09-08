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

![ha-bridge settings](https://i.imgur.com/gFcsUrD.png "ha-bridge settings")

Change `/home/joby/led_scripts/` to the path that you cloned this repo into and `192.168.68.104` to the IP address of your target light (you can scan the network with `python3 -m flux_led -s`)

Make sure the type is set to `Execute Command\Script\Program` and that you click the green Add button next to each item. You can then go to the ha-bridge home screen and test the four functions.

## Script information
### `lighton.sh` and `lightoff.sh`
Simple scripts that takes just the light's IP address as an argument. For example, to turn the light with the address of `192.168.68.104`, you would use the following command:

```
lighton.sh 192.168.68.104
```

### `lightdim.sh`
Calculates the new RGB values to set the light to based on the inputted brightness value. The brightness value is to be given as a decimal between 0 and 1. For example to set the light at `192.168.68.104` to a brightness of 42%, you would use the following command:

```
lightdim.sh 192.168.68.104 0.42
```

### `lightcolor.sh`
Sets the light to a specific RGB color. The red, green, and blue values are given as independant arguments, and as integers from 0 to 255. For example to set the light at `192.168.68.104` to the RGB color (240,56,129), you would use the following command:

```
lightcolor.sh 192.168.104 240 56 129
```
