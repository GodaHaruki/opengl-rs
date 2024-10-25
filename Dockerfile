FROM ubuntu:rolling


RUN apt-get update && \
    apt-get install -y x11-apps \
    mesa-utils \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ARG UID=1000 
# ARG GID=1000
# ARG GROUP_NAME=developer
# ARG USER_NAME=developer

# RUN groupadd -o --gid ${UID} ${GROUP_NAME} && \ # there is default user which uid is 1000 on ubuntu, so need to add -o option
#     useradd -o --uid ${UID} --gid ${GID} --groups ${GROUP_NAME} --create-home --shell /bin/bash ${USER_NAME}

# USER ${USER_NAME}