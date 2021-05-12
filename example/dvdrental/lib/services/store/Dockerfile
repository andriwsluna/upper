FROM google/dart
# uncomment the following if you want to ensure latest Dart and root CA bundle
#RUN apt -y update && apt -y upgrade
WORKDIR /app
COPY pubspec.yaml .
RUN dart pub get
COPY . .
RUN dart pub get --offline
RUN dart compile exe /app/bin/server.dart -o /app/bin/server

FROM subfuzion/dart:slim
COPY --from=0 /app/bin/server /app/bin/server
# COPY any other directories or files you may require at runtime, ex:
#COPY --from=0 /app/static/ /app/static/
EXPOSE 3426
ENTRYPOINT ["/app/bin/server"]
  