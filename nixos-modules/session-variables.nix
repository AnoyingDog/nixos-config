{
  environment.sessionVariables = {

    JACK_DEFAULT_SERVER = "pipewire";
# Force RADV (Mesa Vulkan) — faster than amdvlk for most games
    AMD_VULKAN_ICD = "RADV";

# Proton improvements
    VKD3D_FEATURE_LEVEL = "12_1";

# Mesa shader cache — point to a stable location
    MESA_SHADER_CACHE_DIR = "$HOME/.cache/mesa_shaders";
    DXVK_STATE_CACHE_PATH = "$HOME/.cache/dxvk";
  };
}
