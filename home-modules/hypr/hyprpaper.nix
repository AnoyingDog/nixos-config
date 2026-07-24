{ assets, ... }: 

{
  services.hyprpaper = {
    enable = false;
    settings = {
      splash = false; 
      wallpaper = [{
        monitor = "";
        path = toString assets.wallpaper;
        fit_mode = "cover";
      }];
    };
  };
}
