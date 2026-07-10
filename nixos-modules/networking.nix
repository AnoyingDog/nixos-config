{
  networking = {
    hostName = "The-Silly-Machine";
    #interfaces.enp5s0 = {
      #ipv4.addresses = [{
        #address = "192.168.1.81";
        #prefixLength = 24;
      #}];
    #};
    #defaultGateway = "192.168.1.1";
    #nameservers = [ "1.1.1.1" "8.8.8.8" ];

    networkmanager = {
      enable = true;
      #unmanaged = [ "enp5s0" ];
    };
  };
}

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
