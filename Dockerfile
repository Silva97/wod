FROM debian:13

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt install -y --no-install-recommends \
       wine wine64 wine32 xvfb \
       libgl1 libgl1:i386 \
       libegl1 libegl1:i386 \
       libglvnd0 libglvnd0:i386 \
       libvulkan1 libvulkan1:i386 \
       vulkan-tools mesa-utils \
       libpulse0 libpulse0:i386 \
       alsa-utils libasound2 libasound2:i386 \
       procps pciutils \
    && rm -rf /var/lib/apt/lists/*

ENV WINEPREFIX=/tmp/.wine
ENV WINEARCH=win64

ENV __NV_PRIME_RENDER_OFFLOAD=1
ENV __GLX_VENDOR_LIBRARY_NAME=nvidia
ENV __VK_LAYER_NV_optimus=NVIDIA_only

WORKDIR /app

ENTRYPOINT ["wine"]
