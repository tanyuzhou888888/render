#基础镜像
FROM ubuntu:22.04
#更新ubuntu并安装shellinabox
RUN apt-get update && \
    apt-install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/kuv.apt/lists/* /var/tmp/* 
  #修改用户名root密码为root    
RUN echo 'root':'root'|chpasswd

#报漏端口：22
EXPOSE 22
#启动shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
