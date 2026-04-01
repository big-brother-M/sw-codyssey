# Development Workstation Mission

## 1. 프로젝트 개요
- 터미널, Docker, Git/GitHub를 사용해 재현 가능한 개발 워크스테이션을 구축한다.
- CLI 조작, 권한, 컨테이너 실행, 커스텀 이미지, 포트 매핑, 바인드 마운트, 볼륨 영속성, GitHub 연동을 검증한다.

## 2. 실행 환경
- OS : mac os 26.3.1 (a)(25D771280a)
- Shell : zsh
- Terminal : iTerm2
- Docker : 28.5.2
- Git : 2.50.1 (Apple Git-155)

## 3. 수행 체크리스트- [x] 터미널 기본 조작
- [x] 권한 변경 실습
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] ubuntu 컨테이너 실행 및 내부 명령 수행
- [x] docker images / ps / logs / stats 확인
- [x] Dockerfile 기반 커스텀 이미지 빌드
- [x] 포트 매핑 접속 확인
- [x] 바인드 마운트 반영 확인
- [x] 볼륨 영속성 확인
- [x] Git 설정
- [x] GitHub / VS Code 연동

## 4. 터미널 조작 로그
╭─    ~/Doc/sw-codyssey  on   main ?1 
╰─ mkdir cli-practice                                                        ─╯

╭─    ~/Doc/sw-codyssey  on   main ?1 
╰─ mkdir -p workstation-mission                                              ─╯

╭─    ~/Doc/sw-codyssey  on   main ?1 
╰─ cd workstation-mission                                                    ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?1 
╰─ mkdir -p docs/images                                                      ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?1 
╰─ mkdir site                                                                ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?1 
╰─ mkdir bind-site                                                           ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?1 
╰─ touch README.md                                                           ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ pwd                                                                       ─╯
/Users/seongwoo/Documents/sw-codyssey/workstation-mission

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ ls -la                                                                    ─╯
total 0
drwxr-xr-x@ 6 seongwoo  staff  192  4월  1 17:36 .
drwxr-xr-x@ 5 seongwoo  staff  160  4월  1 17:36 ..
drwxr-xr-x@ 2 seongwoo  staff   64  4월  1 17:35 bind-site
drwxr-xr-x@ 3 seongwoo  staff   96  4월  1 17:35 docs
-rw-r--r--@ 1 seongwoo  staff    0  4월  1 17:36 README.md
drwxr-xr-x@ 2 seongwoo  staff   64  4월  1 17:35 site

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ mkdir cli-lab                                                             ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cd cli-lab                                                                ─╯

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ touch empty.txt                                                           ─╯

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ echo "Hello-World" > note.txt                                             ─╯

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ cat note.txt                                                              ─╯
Hello-World

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ cp note.txt note-copy.txt                                                 ─╯

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ mv note-copy.txt renamed.txt                                              ─╯

╭─    ~/Doc/sw-codyssey/w/cli-lab  on   main ?2 
╰─ cd ..                                                                     ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ mv cli-lab cli-practice                                                   ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ rm -f cli-practice/empty.txt                                              ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ rm -f cli-practice/note.txt                                               ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ rm -f cli-practice/renamed.txt                                            ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ rmdir cli-practice


## 5. 권한 실습
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ touch perm_file.txt                                                       ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ mkdir perm_dir                                                            ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ chmod 600 perm_file.txt                                                   ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ chmod 700 perm_dir                                                        ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ ls -l perm_file.txt                                                       ─╯
-rw-------@ 1 seongwoo  staff  0  4월  1 17:49 perm_file.txt

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ ls -ld perm_dir                                                           ─╯
drwx------@ 2 seongwoo  staff  64  4월  1 17:50 perm_dir

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ chmod 644 perm_file.txt                                                   ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ chmod 755 perm_dir                                                        ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ ls -l perm_file.txt                                                       ─╯
-rw-r--r--@ 1 seongwoo  staff  0  4월  1 17:49 perm_file.txt

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ ls -ld perm_dir                                                           ─╯
drwxr-xr-x@ 2 seongwoo  staff  64  4월  1 17:50 perm_dir

## 6. Docker 설치 및 점검
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker --version                                                          ─╯
Docker version 28.5.2, build ecc6942

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker info                                                               ─╯
Client:
 Version:    28.5.2
 Context:    orbstack
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /Users/seongwoo/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.3
    Path:     /Users/seongwoo/.docker/cli-plugins/docker-compose

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 28.5.2
 Storage Driver: overlay2
  Backing Filesystem: btrfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: d842d7719497cc3b774fd71620278ac9e17710e0
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 OSType: linux
 Architecture: aarch64
 CPUs: 10
 Total Memory: 7.807GiB
 Name: orbstack
 ID: 38b30ca5-b5a3-43e5-abc5-e7f1b0805735
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64

WARNING: DOCKER_INSECURE_NO_IPTABLES_RAW is set

## 7. Docker 기본 운영 명령
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker images                                                             ─╯
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps                                                                 ─╯
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps -a                                                              ─╯
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run hello-world                                                    ─╯
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
58dee6a49ef1: Pull complete
Digest: sha256:452a468a4bf985040037cb6d5392410206e47db9bf5b7278d281f94d1c2d0931
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/


╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker images                                                             ─╯
REPOSITORY    TAG       IMAGE ID       CREATED      SIZE
hello-world   latest    eb84fdc6f2a3   8 days ago   5.2kB

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps                                                                 ─╯
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps -a                                                              ─╯
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
9317383f6c14   hello-world   "/hello"   37 seconds ago   Exited (0) 36 seconds ago             quirky_grothendieck

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -d --name log-demo alpine sh -c 'while true; do date; sleep 2; don
e'
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
d8ad8cd72600: Pull complete
Digest: sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
Status: Downloaded newer image for alpine:latest
3dfbc3a8739905df0331ca78013d6ec257fd87c0c19120927dd7de8ce9cd0b4c

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps                                                                 ─╯
CONTAINER ID   IMAGE     COMMAND                   CREATED         STATUS         PORTS     NAMES
3dfbc3a87399   alpine    "sh -c 'while true; …"   4 seconds ago   Up 3 seconds             log-demo

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker logs log-demo                                                      ─╯
Wed Apr  1 09:54:11 UTC 2026
Wed Apr  1 09:54:13 UTC 2026
Wed Apr  1 09:54:15 UTC 2026
Wed Apr  1 09:54:17 UTC 2026
Wed Apr  1 09:54:19 UTC 2026

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker stats --no-stream log-demo                                         ─╯
dcCONTAINER ID   NAME       CPU %     MEM USAGE / LIMIT   MEM %     NET I/O         BLOCK I/O   PIDS
3dfbc3a87399   log-demo   0.26%     916KiB / 7.807GiB   0.01%     1.13kB / 126B   0B / 0B     2

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker stop log-demo                                                      ─╯
docker rm log-demolog-demo

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker rm log-demo                                                        ─╯
log-demo

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps -a                                                              ─╯
CONTAINER ID   IMAGE          COMMAND    CREATED          STATUS                      PORTS     NAMES
80a53f3ce0ca   ubuntu:24.04   "bash"     47 minutes ago   Exited (0) 46 minutes ago             ubuntu-test
9317383f6c14   hello-world    "/hello"   59 minutes ago   Exited (0) 59 minutes ago             quirky_grothendieck

## 8. ubuntu 컨테이너 실습
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker pull ubuntu:24.04                                                  ─╯
24.04: Pulling from library/ubuntu
86790fc5660d: Pull complete
Digest: sha256:186072bba1b2f436cbb91ef2567abca677337cfc786c86e107d25b7072feef0c
Status: Downloaded newer image for ubuntu:24.04
docker.io/library/ubuntu:24.04

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -it --name ubuntu-test ubuntu:24.04 bash                       ─╯
root@80a53f3ce0ca:/# ls
bin   dev  home  media  opt   root  sbin  sys  usr
boot  etc  lib   mnt    proc  run   srv   tmp  var
root@80a53f3ce0ca:/# echo "hello from ubuntu container"
hello from ubuntu container
root@80a53f3ce0ca:/# pwd
/
root@80a53f3ce0ca:/# exit
exit

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps                                                                 ─╯
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker ps -a                                                              ─╯
CONTAINER ID   IMAGE          COMMAND    CREATED          STATUS                      PORTS     NAMES
80a53f3ce0ca   ubuntu:24.04   "bash"     39 seconds ago   Exited (0) 10 seconds ago             ubuntu-test
9317383f6c14   hello-world    "/hello"   12 minutes ago   Exited (0) 12 minutes ago             quirky_grothendieck

## 9. attach / exec 차이
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -dit --name ubuntu-keep ubuntu:24.04 bash                      ─╯
df02d42b83656f19145dcb429774010b32953c0ae925593b405dfa2d6066439b

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker attach ubuntu-keep                                                 ─╯
root@df02d42b8365:/# echo "attach session"
attach session
root@df02d42b8365:/# read escape sequence

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker exec -it ubuntu-keep bash                                          ─╯
root@df02d42b8365:/# echo "exec seesion"
exec seesion
root@df02d42b8365:/# exit
exit

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker stop ubuntu-keep                                                   ─╯
ubuntu-keep

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker rm ubuntu-keep                                                     ─╯
ubuntu-keep

## 10. 커스텀 이미지 제작
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cat > site/index.html <<'EOF'                                             ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Workstation Mission</title>
</head>
<body>
  <h1>Docker Workstation Mission</h1>
  <p>커스텀 NGINX 컨테이너</p>
  <p>Port mapping, bind mount, volume persistence를 실습했습니다.</p>
</body>
</html>
EOF

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cat > Dockerfile <<'EOF'                                                  ─╯
FROM nginx:alpine
LABEL org.opencontainers.image.title="workstation-mission-web"
ENV APP_ENV=dev
COPY site/ /usr/share/nginx/html/
EXPOSE 80
EOF

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker build -t workstation-web:1.0 .                                     ─╯
[+] Building 5.2s (7/7) FINISHED                                docker:orbstack
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 180B                                       0.0s
 => [internal] load metadata for docker.io/library/nginx:alpine            2.6s
 => [internal] load .dockerignore                                          0.1s
 => => transferring context: 2B                                            0.0s
 => [internal] load build context                                          0.1s
 => => transferring context: 358B                                          0.0s
 => [1/2] FROM docker.io/library/nginx:alpine@sha256:e7257f1ef28ba17cf7c2  2.4s
 => => resolve docker.io/library/nginx:alpine@sha256:e7257f1ef28ba17cf7c2  0.1s
 => => sha256:25adace5af65f8b0af0f205c133d7408912c2272e69edc3 952B / 952B  0.9s
 => => sha256:e7257f1ef28ba17cf7c248cb8ccf6f0c6e0228ab9 10.33kB / 10.33kB  0.0s
 => => sha256:f3cd139bc09d96a99d569b31d5c1b3b08060b63cfc112e3 627B / 627B  0.8s
 => => sha256:d70d63a8de139d41315d23b75cefcc12b718a3b29d2 2.50kB / 2.50kB  0.0s
 => => sha256:e7b8033f1661e1939b4b796ed059b388e19303994 12.34kB / 12.34kB  0.0s
 => => sha256:5c54475b17070123dd69a8fc46181de574bd18862ff 1.89MB / 1.89MB  0.5s
 => => extracting sha256:5c54475b17070123dd69a8fc46181de574bd18862ff89af4  0.1s
 => => sha256:8653d9094a720cf27760bfcc013cf847d30e3939681a558 401B / 401B  1.0s
 => => extracting sha256:f3cd139bc09d96a99d569b31d5c1b3b08060b63cfc112e36  0.0s
 => => sha256:c31eed8447fd3e8eb306b1f9335d432eabd6c3a10d3 1.21kB / 1.21kB  1.2s
 => => extracting sha256:25adace5af65f8b0af0f205c133d7408912c2272e69edc3d  0.0s
 => => sha256:3dbfa89fa4bb25071a7889312fba60d046f22b6afc0 1.39kB / 1.39kB  1.3s
 => => extracting sha256:8653d9094a720cf27760bfcc013cf847d30e3939681a5586  0.0s
 => => sha256:2286bacaa097480a5e197288c73d3f00d4ba2a1f7 19.72MB / 19.72MB  2.0s
 => => extracting sha256:c31eed8447fd3e8eb306b1f9335d432eabd6c3a10d339145  0.0s
 => => extracting sha256:3dbfa89fa4bb25071a7889312fba60d046f22b6afc0d9425  0.0s
 => => extracting sha256:2286bacaa097480a5e197288c73d3f00d4ba2a1f7083216a  0.2s
 => [2/2] COPY site/ /usr/share/nginx/html/                                0.1s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:90e93da27fcaeb366626f2a67885cabc201701d491d58  0.0s
 => => naming to docker.io/library/workstation-web:1.0                     0.0s

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -d --name workstation-web -p 8080:80 workstation-web:1.0       ─╯
docker ps
docker logs workstation-web
curl http://localhost:8080
23124ec594fce80fea0e6ee4a6109d4dbc122e5ec4c035e391656f95a0370d83
CONTAINER ID   IMAGE                 COMMAND                   CREATED                  STATUS                  PORTS                                     NAMES
23124ec594fc   workstation-web:1.0   "/docker-entrypoint.…"   Less than a second ago   Up Less than a second   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   workstation-web
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/04/01 10:02:47 [notice] 1#1: using the "epoll" event method
2026/04/01 10:02:47 [notice] 1#1: nginx/1.29.7
2026/04/01 10:02:47 [notice] 1#1: built by gcc 15.2.0 (Alpine 15.2.0)
2026/04/01 10:02:47 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/04/01 10:02:47 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/04/01 10:02:47 [notice] 1#1: start worker processes
2026/04/01 10:02:47 [notice] 1#1: start worker process 30
2026/04/01 10:02:47 [notice] 1#1: start worker process 31
2026/04/01 10:02:47 [notice] 1#1: start worker process 32
2026/04/01 10:02:47 [notice] 1#1: start worker process 33
2026/04/01 10:02:47 [notice] 1#1: start worker process 34
2026/04/01 10:02:47 [notice] 1#1: start worker process 35
2026/04/01 10:02:47 [notice] 1#1: start worker process 36
2026/04/01 10:02:47 [notice] 1#1: start worker process 37
2026/04/01 10:02:47 [notice] 1#1: start worker process 38
2026/04/01 10:02:47 [notice] 1#1: start worker process 39
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Workstation Mission</title>
</head>
<body>
  <h1>Docker Workstation Mission</h1>
  <p>커스텀 NGINX 컨테이너</p>
  <p>Port mapping, bind mount, volume persistence를 실습했습니다.</p>
</body>
</html>

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cat > bind-site/index.html <<'EOF'                                        ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>Before Change</h1>
</body>
</html>
EOF

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -d --name bind-web -p 8081:80 -v "$(pwd)/bind-site:/usr/share/nginx/html" nginx:alpine
docker ps
curl http://localhost:8081
Unable to find image 'nginx:alpine' locally
alpine: Pulling from library/nginx
d8ad8cd72600: Already exists
5c54475b1707: Already exists
f3cd139bc09d: Already exists
25adace5af65: Already exists
8653d9094a72: Already exists
c31eed8447fd: Already exists
3dbfa89fa4bb: Already exists
2286bacaa097: Already exists
Digest: sha256:e7257f1ef28ba17cf7c248cb8ccf6f0c6e0228ab9c315c152f9c203cd34cf6d1
Status: Downloaded newer image for nginx:alpine
a1f7b6dcb838cea9cfc38d4e238ebe5dc262519dea9fb111bdd9e48d77ecd9f1
CONTAINER ID   IMAGE                 COMMAND                   CREATED                  STATUS                  PORTS                                     NAMES
a1f7b6dcb838   nginx:alpine          "/docker-entrypoint.…"   Less than a second ago   Up Less than a second   0.0.0.0:8081->80/tcp, [::]:8081->80/tcp   bind-web
23124ec594fc   workstation-web:1.0   "/docker-entrypoint.…"   2 minutes ago            Up 2 minutes            0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   workstation-web
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>Before Change</h1>
</body>
</html>

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cat > bind-site/index.html <<'EOF'                                        ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>After Change</h1>
</body>
</html>
EOF

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ curl http://localhost:8081                                                ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>After Change</h1>
</body>
</html>

## 11. 포트 매핑 접속 증거
docs/images/browser-8080.png
docs/images/browser-8081.png
첨부했습니다.

## 12. 바인드 마운트 검증
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ cat > bind-site/index.html <<'EOF'                                        ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>After Change</h1>
</body>
</html>
EOF

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ curl http://localhost:8081                                                ─╯
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>After Change</h1>
</body>
</html>

## 13. Docker 볼륨 영속성 검증
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker volume create mydata                                               ─╯
mydata

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker volume ls                                                          ─╯
DRIVER    VOLUME NAME
local     mydata

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -d --name vol-test -v mydata:/data ubuntu:24.04 sleep infinity ─╯
9c84eab4cbfe99603e7e071ee09f5050506f4a5cd44b8e45c5c1010ccfcf39c6

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker exec -it vol-test bash -lc 'echo "hello volume" > /data/hello.txt && c
at /data/hello.txt'
hello volume

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker rm -f vol-test                                                     ─╯
vol-test

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker run -d --name vol-test2 -v mydata:/data ubuntu:24.04 sleep infinity
6dc950f35f092d858058c418b4acf5e7a71d9ece4a1d56229abc131076a8d198

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ docker exec -it vol-test2 bash -lc 'cat /data/hello.txt'                  ─╯
hello volume

## 14. Git 설정 및 GitHub 연동
╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ git config --global user.name "big-brother"                               ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ git config --global user.email "big-brother@kakao.com"                    ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ git config --global init.defaultBranch main                               ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ git config --list --global                                                ─╯


╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?2 
╰─ git init                                                                  ─╯
Initialized empty Git repository in /Users/seongwoo/Documents/sw-codyssey/workstation-mission/.git/

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main ?6 
╰─ git add .                                                                 ─╯

╭─    ~/Doc/sw-codyssey/workstation-mission  on   main +7 
╰─ git commit -m "init : 워크스페이스 구축 실습"                             ─╯
[main (root-commit) e4a6f59] init : 워크스페이스 구축 실습
 7 files changed, 62 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 README.md
 create mode 100644 bind-site/index.html
 create mode 100644 docs/images/browser-8080.png
 create mode 100644 docs/images/browser-8081.png
 create mode 100644 perm_file.txt
 create mode 100644 site/index.html

## 15. VS Code GitHub 연동 증거

## 16. 트러블슈팅

## 17. 학습 정리

권한 :
    - 644 = rw-r--r--
        - 소유자: 읽기, 쓰기
        - 그룹: 읽기
        - 기타: 읽기
    - 755 = rwxr-xr-x
        - 소유자: 읽기, 쓰기, 실행
        - 그룹: 읽기, 실행
        - 기타: 읽기, 실행

attach vs exec :
    - attach: 이미 실행 중인 메인 프로세스의 입출력에 직접 붙는다.
    - exec: 실행 중인 컨테이너 안에서 새로운 명령 또는 셸을 추가로 실행한다.
