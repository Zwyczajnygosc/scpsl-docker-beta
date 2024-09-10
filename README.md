# SCP: Secret Laboratory Dockerfile

## Contents

  - [Summary](#summary) 
  - [Configuration](#configuration)
    - [ENV Variables](#env-variables) 
    - [Volumes & Mounts](#volumes--mounts)
  - [Example Compose](#example-docker-composeyml)

## Summary
This is a fork of [lsuvgs/scpsl-exiled](https://hub.docker.com/r/lsuvgs/scpsl-exiled) which was created by me for the LSU Video game and ESports Society (LSUVES)
during my term as technical officer (2023 - 2024). At this point, with the approval of the successor committee,
I intend to maintain this repo as the official replacement for the one published under the lsuvgs account.

As with the original image, the primary goal of this image is to fix several issues that were present with 
our previous solution, namely [t3l3tubie/scpsl](https://hub.docker.com/r/t3l3tubie/scpsl). Secondarily, this image
also aims to improve maintainability and eventually provide features that were not present in the original.

Unlike [t3l3tubie/scpsl](https://hub.docker.com/r/t3l3tubie/scpsl), this image is built from a general purpose
ubuntu 20.04 base image, as this provides the correct version of GLibC (which I did not feel qualified enough
to try and upgrade manually due to compatibility issues) while providing additional tools for inspection through
the `docker attach` functionality.

On top of this, this image is also designed to allow for automatic updates, removing the need to manually pull a 
new image every time the game updates. This comes at the cost of a slightly longer boot sequence, however
the worst of this can be addressed by holding steamcmd in a named volume.


## Configuration

### ENV Variables

| Variable     | Description                                              | Default Value |
|--------------|----------------------------------------------------------|---------------|
| SCPSL_PORT   | Sets the port variable for LocalAdmin on container start | 7777          |
| ENABLE_PATCH | Enables the patch applied to ensure functionality.       | true          |
|              |                                                          |               |


### Volumes & Mounts
`/config` is provided as a read/write mountpoint for `/home/<user>/.config/`
- `/config/SCP: Secret Laboratory` should contain all base game SCP:SL configs


**_All volumes should be read/writable by GUID 22035 to ensure functionality_**


## Example docker-compose.yml
```yaml
version: '3'

services:
  server:

    image: doobig/scpsl-docker:latest
    container_name: scpsl

    restart: unless-stopped
    stdin_open: true
    tty: true

    ports:
      - "7777:7777"

    environment:
      SCPSL_PORT: 7777

    volumes:
      - ./scpsl-data:/config/SCP Secret Laboratory
#      - steamcmd:/home/scpsl/.steamcmd

#volumes:
#  steamcmd:
```
