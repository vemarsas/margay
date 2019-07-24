# margay
Everything you need to install a Margay device on real hardware.

After installing Debian, as root, type:

```bash
wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup | bash
```

If you only need core and openvpn functionality, great, you've done!

---

Optionally, if you want hotspot/RADIUS functionality, then also run:

```bash
wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-hotspot | bash
```

or the virtualization functionality (private cloud hypervisor, if you fancy):

```bash
wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-virt | bash
```

...and that's it.

Happy admin :stuck_out_tongue_winking_eye:
