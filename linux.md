# System wide configuation for Linux

## Setttings

### Disable automatic audio device switching

On linux, alsa automaticaly switch the output and input device on the system as they are connected/disconnected.
This can be frsustrating when your hdmi connection is lost by the monitor turning hitself off and the audio is
rooted back to your build-in speaker. Or when you plug-in your usb microhpone and the output is sent to the mic's
audio feedback.

Thanksfully this automatic selection can be disabled by disabling this feature in the config file
`/etc/pulse/default.pa` by commentting the line:
```diff
-load-module module-switch-on-port-available
+#load-module module-switch-on-port-available
```
Then a reboot or a reload of pulse audio (with `pulseaudio -k`) should be working!

As a note: Windows does a good job at keeping track of your prefered device when you plug/unplug an
audio device. It automaticaly switch back to your prefered device when you connect it again.
