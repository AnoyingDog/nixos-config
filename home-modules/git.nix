{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
     user = {
      user.name = "AnoyingDog";
      user.email = "AnoyingDog@users.noreply.github.com";
     };
      credential.helper = "!gh auth git-credential";
    };
  };
}
