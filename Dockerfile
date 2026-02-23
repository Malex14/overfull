ARG VERSION=latest
FROM sharelatex/sharelatex:${VERSION}

COPY ./url_proxy.patch /tmp/url_proxy.patch
# Install TeX Live and Inkscape
# Inkscape is required for SVG support in TeX Live
RUN tlmgr update --self \
    && tlmgr install scheme-full \
    && echo "shell_escape = t" >> $(tlmgr version | sed '2q;d' | cut -d ' ' -f4)/texmf.cnf \
    && apt update \
    && apt install -y --no-install-recommends inkscape \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/* \
    && tlmgr path add \
    && patch -p1 -i /tmp/url_proxy.patch \
    && rm /tmp/url_proxy.patch