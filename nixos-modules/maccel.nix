{ inputs, ...}: 
  
{
  
  imports = [ inputs.maccel.nixosModules.default ];

  hardware.maccel = {
    enable = true;
    enableCli = true; 
    parameters = {
      mode = "natural";
      sensMultiplier = 1.0;
      yxRatio = 1.0;
      inputDpi = 1600.0;
      angleRotation = 0.0;
      decayRate = 10.0;
      offset = 3.0;
      limit = 1.3;
    };
  };
}

