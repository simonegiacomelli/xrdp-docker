FROM debian:bullseye

RUN apt-get update && apt-mark hold iptables && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      dbus-x11 \
      psmisc \
      xdg-utils \
      x11-xserver-utils \
      x11-utils && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      xfce4 && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      libgtk-3-bin \
      libpulse0 \
      mousepad \
      xfce4-notifyd \
      xfce4-taskmanager \
      xfce4-terminal && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      xfce4-battery-plugin \
      xfce4-clipman-plugin \
      xfce4-cpufreq-plugin \
      xfce4-cpugraph-plugin \
      xfce4-diskperf-plugin \
      xfce4-datetime-plugin \
      xfce4-fsguard-plugin \
      xfce4-genmon-plugin \
      xfce4-indicator-plugin \
      xfce4-netload-plugin \
      xfce4-places-plugin \
      xfce4-sensors-plugin \
      xfce4-smartbookmark-plugin \
      xfce4-systemload-plugin \
      xfce4-timer-plugin \
      xfce4-verve-plugin \
      xfce4-weather-plugin \
      xfce4-whiskermenu-plugin \
      mc screen unzip net-tools procps p7zip-full ncdu htop curl zip git software-properties-common rofi ntp xrdp xclip

RUN apt-get install wget -y
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable


ARG USER=demo                                                                                                                                                                                               
ARG PASS="123456"                                                                                                                                                                                           
RUN useradd -m -s /bin/bash $USER && echo "$USER:$PASS" | chpasswd                                                                                                                                          
RUN usermod -a -G xrdp demo                                                                                                                                                                                 
USER demo                                                                                                                                                                                                   
COPY .xsessionrc /home/demo                                                                                                                                                                                 
USER root

COPY entrypoint.sh /entrypoint.sh                                                                                                                                                                           
RUN ["chmod", "+x", "/entrypoint.sh"]                                                                                                                                                                       
ENTRYPOINT ["/entrypoint.sh"]                                                                                                                                                                               
CMD ["/bin/sh" , "-c", "sleep infinity"] 
