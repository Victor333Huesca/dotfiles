# System wide configuration for Fedora

## Sudo / Root

### Failed password delay

By default there is a long delay on failed password when running command under `sudo`.
In order to remove or simply reduce this delay the following patch can be applied to `/etc/pam.d/system-auth`:
```
- auth        sufficient    pam_unix.so try_first_pass nullok
+ auth        optional      pam_faildelay.so delay=250000
+ auth        sufficient    pam_unix.so try_first_pass nullok nodelay
```
The __delay=250000__ can be adjusted to the desired delay in __us__.
