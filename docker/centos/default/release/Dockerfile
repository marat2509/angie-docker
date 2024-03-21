FROM centos:latest

COPY angie.repo /etc/yum.repos.d/angie.repo

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

RUN yum install -y angie

RUN yum clean all

RUN if [ -f "/etc/yum.repos.d/angie.repo" ]; then rm -f /etc/yum.repos.d/angie.repo; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;" ]