return {
  name = "MakeMeHappyBuild",
  builder = function()
    return {
      cmd = { "zsh", "-c", "mmh system build boards/irtt-cp-tl-v4-cc1312/ti-arm-clang/debug; ./post-build.py -s" },
    components = {
        "default",
      },
    }
  end,
  condition = {
    -- You can adjust the filetype condition or remove it if you don't want filtering
    file_exists = "**/system.yaml",
  },
}

