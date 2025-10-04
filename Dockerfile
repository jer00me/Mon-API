FROM redocly/cli AS build
WORKDIR /usr/src/app
COPY ./src/openAPI.yaml .
RUN redocly build-docs --output "index.html" openAPI.yaml

FROM nginx:alpine
COPY --from=build /usr/src/app /usr/share/nginx/html
