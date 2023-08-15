# docker-privoxy

Privoxy is a "privacy enhancing proxy", which can be enabled to filter web pages and remove advertisements. This docker container runs privoxy over Alpine Linux in 6 Mb uncompressed image.

<!-- The image can be pulled from https://hub.docker.com/r/caligari/privoxy/ -->

## Runing privoxy

(please, __read the security note below__)

    docker run -d --name=privoxy -p 8118:8118 caligari/privoxy:latest
    
## Testing privoxy

      curl --proxy http://*host-address*:8118/ http://ifconfig.me

and check it is different from simply running

      curl http://ifconfig.me
      
## Security note

**This container should be executed in a local host or in a VPN.**

Please, don't execute this image in a host accesible from the internet with -p parameter because it __bypasses the Linux firewall__ and you could be opening an __anonymous internet door__.

