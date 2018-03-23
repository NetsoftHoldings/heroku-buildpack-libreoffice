FROM heroku/heroku:16-build

WORKDIR /app

RUN apt-get update

COPY install-jdk.sh /tmp/install-jdk.sh
ENV STACK=heroku-16
RUN bash /tmp/install-jdk.sh '1.8'
ENV PATH=/opt/jdk/.jdk/bin:$PATH

COPY libreoffice.sh /app/
RUN /app/libreoffice.sh
ENV PREFIX=/app/vendor/libreoffice/deps
ENV PATH="$PREFIX/bin:$PATH"
ENV LD_LIBRARY_PATH="$PREFIX/lib"
ENV PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"

RUN dpkg -i /tmp/libreoffice.*/LibreOffice_*/DEBS/*.deb
RUN ln -s /usr/bin/libreoffice* /bin/soffice
