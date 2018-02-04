FROM centos
RUN groupadd -g 48 apache
RUN useradd -u 48 -g 48 apache
RUN cd /var && \
mkdir www && \
cd www && \
mkdir html
RUN cd /var && \
cd lib && \
mkdir myqsl
RUN yum install wget -y
RUN \
cd /var/www/html && \
wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
rm -f latest.tar.gz && \
cp -R -f /var/www/html/wordpress/* /var/www/html && \
rm -rf wordpress/ && \
chown -R apache:apache . && \
chmod -R 755 .

