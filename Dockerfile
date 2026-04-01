FROM nginx:alpine
LABEL org.opencontainers.image.title="workstation-mission-web"
ENV APP_ENV=dev
COPY site/ /usr/share/nginx/html/
EXPOSE 80
