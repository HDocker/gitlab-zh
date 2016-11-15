FROM sameersbn/gitlab:8.8.5-1
MAINTAINER Huang Justin <hoysoft@qq.com>

RUN echo "" \
    && echo "# git clone https://gitlab.com/larryli/gitlab.git" \
    && git clone https://gitlab.com/larryli/gitlab.git \
    && echo "# Generating translation patch" \
    && cd gitlab \
    && git diff origin/8-8-stable..origin/8-8-zh > ../zh_CN.diff \
    && echo "# Patching" \
    && patch -d /home/git/gitlab/embedded/service/gitlab-rails -p1 < ../zh_CN.diff \
    && echo "# Cleaning" \
    && cd .. \
    && rm -rf gitlab \
    && rm *.diff
