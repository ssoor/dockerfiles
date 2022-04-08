FROM ssoor/cypress:yk-test

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    curl \
    x11vnc \
    fluxbox && \
    apt-get clean all && rm -rf /var/lib/apt/lists/*

# Install noVNC
RUN git clone https://hub.fastgit.xyz/novnc/noVNC.git --depth 1 /usr/local/share/noVNC && \
    git clone https://hub.fastgit.xyz/novnc/websockify.git /usr/local/share/noVNC/utils/websockify && \
    ln -s /usr/local/share/noVNC/utils/novnc_proxy /usr/local/bin/novnc_proxy

# Install Chrome
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/google-chrome.deb && \
    apt-get update && \
    apt-get install -y /tmp/google-chrome.deb && \
    apt-get install ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy && \
    rm -f /tmp/google-chrome.deb && \
    apt-get clean all && rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start.sh
COPY noVNC.html  /usr/local/share/noVNC/index.html

CMD ["/usr/local/bin/start.sh"]
