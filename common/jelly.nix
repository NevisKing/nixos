{pkgs, ...}:
{
  services.jellyfin.enable = true;
  services.jellyfin.openFirewall = true;
  services.jellyfin.user = "nevis";
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
