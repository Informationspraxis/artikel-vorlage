FROM rocker/binder:latest

## Declares build arguments
ARG NB_USER
ARG NB_UID

## Installs additional software and needed LaTeX packages
USER root
RUN apt-get update && apt-get install -y --no-install-recommends xsltproc texlive-lang-german
RUN tlmgr install csquotes amsmath eurosym mathspec fontspec upquote microtype geometry hyperref polyglossia natbib biblatex fancyvrb booktabs grffile ulem parskip bidi fancyhdr caption infwarerr babel-german newfloat epstopdf epstopdf-pkg

## Copies your repo files into the Docker Container
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}
