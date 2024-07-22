FROM debian:latest AS build

RUN apt-get update
RUN apt-get install -y curl git unzip

ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.22.3
ARG APP=/home/flutter
ARG APP_CODE=.

RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v
RUN mkdir -p $APP

COPY $APP_CODE $APP

WORKDIR $APP

ARG FIREBASE_APP_ID

RUN flutter clean
RUN flutter pub get
RUN flutter build web -t lib/shared/infrastructure/presentation/main/pages/main.dart --release --no-tree-shake-icons


FROM nginx:1.25.2-alpine as deploy

COPY --from=build /home/flutter/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]