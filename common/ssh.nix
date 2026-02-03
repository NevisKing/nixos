{pkgs, ...}:
{
    users.users.nevis.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgmPLlOqwtoBX3j+ypQgrgd8uDefz4l2WPXLt7GDVe4"
];
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
}
