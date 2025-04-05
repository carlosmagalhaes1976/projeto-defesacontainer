# FROM ubuntu:22.04
FROM ubuntu:jammy

RUN apt-get update \ 
    && apt-get install -yq tzdata locales \
    && rm -rf /var/lib/apt/lists/* \    
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && ln -fs /usr/share/zoneinfo/America/Fortaleza /etc/localtime \
    && dpkg-reconfigure tzdata 

ENV TZ=America/Fortaleza
RUN useradd --create-home -s /bin/bash teste \
        && echo teste:ubuntu | chpasswd
WORKDIR /home/$user
USER $user

CMD ["/bin/bash"]
