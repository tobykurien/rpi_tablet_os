# rpi_tablet_os

Customization of Raspberry Pi OS for DIY Raspberry Pi based tablets. This is a work-in-progress.

View a video of a [7" Raspberry Pi tablet](https://tobykurien.com/images/rpi_tab/rpi-tab.mp4), and an [11.6" Raspberry Pi tablet](https://tobykurien.com/images/rpi_tab/rpi-tab-10.mp4). You can also read the [blog post](https://tobykurien.com/rpi_tab/) detailing some of the features.

# 7" Raspberry Pi tablet

To build the 7" Raspberry Pi tablet, you will need:

- Raspberry Pi: minimum 3b, recommend 4b with 4Gb of RAM. I do not recommend sticking a heatsink on, as over time it will slide off the chip. Active cooling will not be necessary if you don't overclock the Pi, and since the Pi will be in a vertical position during use, it will run cool.
- Official Raspberry Pi touchscreen: if you have the original v1.0 like I do, then the screen brightness cannot be controlled by software, and you may want to consider modifying the LCD controller board with a potentiometer and MOSFET current limiter like I did (details to come).
- 3D-printed case from [Thingiverse](https://www.thingiverse.com/thing:1068762): this is the one I used, however I did not print the rear cover, instead I opted for a clear polycarbonate sheet that I cut to size and screwed into place. The clear polycarbonate allows me to see the activity and power LEDS of the Pi, and also looks great when showing off the tablet to others, as you can see the innards. I also cut a slot into the rear panel to allow me to remove and insert the microSD card.
- (Optional) [microSD slot extender](https://www.amazon.com/sd-card-extension/s?k=sd+card+extension): will allow you to mount a microSD slot into the side of the case for easy card access.
- Bolts/screws/grubs, drill, and screwdriver to put everything together

The Pi is mounted onto the back of the LCD in an inverted and offset way. It will require that you gently bend the Ground and 5V pins on the Pi GPIO outwards a little so that the jumpers from the LCD driver board can connect while still allowing the Pi to lie flat against the back of the LCD. The assembled unit is shown in this video:

[7" Raspberry Pi tablet](https://tobykurien.com/images/rpi_tab/rpi-tab.mp4)

# 11.6" full-HD Pi tablet

To build the 11.6" Raspberry Pi tablet, you will need:

- Raspberry Pi: minimum 3b, recommend 4b with 4Gb of RAM. As stated above, a heatsink isn't necessary provided you do not overclock the Pi.
- [11.6" touch screen](https://www.waveshare.com/11.6inch-hdmi-lcd-h-with-case.htm): when selecting a screen for your build, you should consider the placement of the HDMI, power, and USB ports on the screen. If they are placed along the edge, you will have big cables and connectors on the side of your tablet, making it difficult to carry and use.
- Boost converter: to convert the 5V from the powerbank to 12V for the LCD. I used [this one](https://www.robotics.org.za/MT3608)
- Power barrel connector: the thin barrel connector for the LCD. I used the original one that came with the LCD by cutting it off the included power supply.
- Sacrificial USB cable: a USB cable of equal length to the one you will use for the Pi, but the connector will be cut off so that you can solder the power cables into the boost coverter, which will then be connected to the power connector for the LCD. I twisted the two USB cables together to make it feel like a single cable, which makes it easier to manage.
- Bolts/screws/double-sided tape, etc. to put everything together

This is an easier build than the 7" tablet above, although the tablet is not as portable, and it is harder to power. The gorgeous screen makes it worth it though. You may need to experiment with a few powerbanks to make sue the Pi isn't power-limited, or use two powerbanks taped/bound together. The build is described in this video:

[11.6" Raspberry Pi tablet](https://tobykurien.com/images/rpi_tab/rpi-tab-10.mp4)

# RPi Tablet OS

You can install any OS you like, with Raspberry Pi OS and Ubuntu MATE providing decent support for the touch screen out-of-the-box. However, you will start running into usability issues, for example, how do I type text, minimize/maximize, switch between apps, get out of full screen, etc. with no keyboard or mouse attached? The scripts below are meant to solve many of these problems, specifically for Raspberry Pi OS.

Please only run this on a fresh installation of the latest Raspberry Pi OS, as the script makes many assumptions that may delete data from an already-customized installation.

## Usage

After installing Raspberry Pi OS, run the following command in a terminal:

`curl "https://raw.githubusercontent.com/tobykurien/rpi_tablet_os/master/install.sh" | /bin/sh`

Once installed, you can use the following touch gestures:

- Two-finger tap to right-click. Whichever finger touched first becomes the point that it right-clicked. You can also long-press for a right-click, but there are instances where that might not be possible.
- Two-finger drag up or down for scrolling. You can also drag up or down with one finger for scrolling, but there are instances where that might not be possible.
- Three-finger swipe up to maximize a window
- Three-finger swipe down to minimize a window
- Three-finger tap to full-screen or un-full-screen a window
- Four-finger swipe left or right to switch between browser tabs

The above gestures can be changed in `~/.config/touchegg/touchegg.conf`

## What the script does

- Installs the OnBoard on-screen keyboard
- Installs and configures touchegg (not available by default)
- Installs the latest Firefox (only the old ESR is available by default) and applies some touch fixes
- Makes bluetooth audio streaming work
- Enables hardware acceleration as described in [this article](https://www.dedoimedo.com/computers/rpi4-ubuntu-mate-hw-video-acceleration.html)
