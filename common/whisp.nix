{inputs,...}:
{
imports = [inputs.whisp-away.nixosModules.nixos];
services.whisp-away = {
  enable = true;
  defaultModel = "small.en";        # Default Whisper model
  defaultBackend = "whisper-cpp";   # Default backend (whisper-cpp or faster-whisper)
  accelerationType = "vulkan";      # GPU acceleration type (requires rebuild)
  useClipboard = false;             # Output mode (false = type, true = clipboard)
};
}
