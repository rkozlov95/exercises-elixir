FROM elixir:1.10.1

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -yqq git curl python3-pip libyaml-dev zip unzip
RUN apt-get install -yqq nodejs npm

RUN pip3 install yamllint
RUN apt-get install -yqq jq
RUN pip3 install yq
RUN npm install -g ajv-cli

WORKDIR /exercises-elixir

ADD mix.* ./
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info
RUN mix deps.get

COPY . .
