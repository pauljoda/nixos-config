{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };
}
