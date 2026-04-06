{...}:
{
virtualisation.docker.enable = true;
hardware.nvidia-container-toolkit.enable = true;
virtualisation.docker.daemon.settings.features.cdi = true;
virtualisation.podman.enable = true;
virtualisation.containers.cdi.dynamic.nvidia.enable = true;
}
