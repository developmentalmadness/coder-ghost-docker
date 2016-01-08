FROM ghost

MAINTAINER Mark J. Miller

RUN awsDeps='\
    unzip \
    ' \
    && set -x \
    && apt-get update && apt-get install -y $awsDeps vim --no-install-recommends && rm -rf /var/lib/apt/lists/* \
    && curl "https://github.com/developmentalmadness/CoderGhostTheme/archive/master.zip" -Lko "coder-ghost.zip" \
    && curl "https://github.com/developmentalmadness/Casper/archive/master.zip" -Lko "dvm-casper.zip" \
    && unzip coder-ghost.zip -d ./content/themes/ \
    && unzip dvm-casper.zip -d ./content/themes/ \
    && mv ./content/themes/CoderGhostTheme-master/ ./content/themes/coder-ghost \
    && mv ./content/themes/Casper-master/ ./content/themes/dvm-casper \
	&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps 

CMD ["npm", "start"]
