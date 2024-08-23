FROM cloudogu/reveal.js:4.0.2-r3 as base

FROM base as aggregator
USER root
RUN mkdir -p /dist/reveal
COPY . /dist/reveal
RUN mv /dist/reveal/resources/ /dist

FROM base
ENV TITLE='my Title' \
    THEME_CSS='cloudogu-black.css'
COPY --from=aggregator --chown=nginx /dist /