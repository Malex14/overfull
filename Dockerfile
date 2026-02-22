ARG VERSION=latest
FROM sharelatex/sharelatex:${VERSION}

# Install TeX Live and Inkscape
# Inkscape is required for SVG support in TeX Live
RUN tlmgr update --self \
    && tlmgr install scheme-full \
    && echo "shell_escape = t" >> $(tlmgr version | sed '2q;d' | cut -d ' ' -f4)/texmf.cnf \
    && apt update \
    && apt install -y --no-install-recommends inkscape \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/* \
    && tlmgr path add