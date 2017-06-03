# Channel

OpenSSH based localtunnel.

## Usage

Get the server image and deploy it on your own server:

```sh
# m31271n/channel is the prebuild image's name
docker run -d --network host m31271n/channel -e PASSWORD=<YOUR OWN PASSWORD>
```

Get the client:

```sh
curl https://raw.githubusercontent.com/rekcod/channel/master/channel -o channel && chmod +x channel
```

Run the client:

```sh
# Remote port forward <remote address>:<remote port> to <local port>
channel -a <remote address> -r <remote port> -l <local port>
```

## Last

Inspired by [Rodny Rehm](https://blog.rodneyrehm.de/archives/38-You-may-not-need-localtunnel-or-ngrok.html).
