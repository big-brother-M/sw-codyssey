# Development Workstation Mission

## 1. 프로젝트 개요

- 터미널, Docker, Git/GitHub를 사용해 재현 가능한 개발 워크스테이션을 구축한다.
- CLI 조작, 권한, 컨테이너 실행, 커스텀 이미지, 포트 매핑, 바인드 마운트, 볼륨 영속성, GitHub 연동을 검증한다.

## 2. 실행 환경

| 항목 | 버전 |
|------|------|
| OS | macOS 26.3.1 (a) (25D771280a) |
| Shell | zsh |
| Terminal | iTerm2 |
| Docker | 28.5.2 |
| Git | 2.50.1 (Apple Git-155) |

## 3. 수행 체크리스트

- [x] 터미널 기본 조작
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

---

## 4. 터미널 조작 로그

디렉터리 구조 생성 및 기본 CLI 명령 실습.

```bash
# 디렉터리 생성
mkdir cli-practice
mkdir -p workstation-mission
cd workstation-mission
mkdir -p docs/images
mkdir site
mkdir bind-site

# 파일 생성 및 현재 위치 확인
touch README.md
pwd
# /Users/seongwoo/Documents/sw-codyssey/workstation-mission
```

```bash
# 디렉터리 내용 확인
ls -la
```
```
total 0
drwxr-xr-x@ 6 seongwoo  staff  192  4월  1 17:36 .
drwxr-xr-x@ 5 seongwoo  staff  160  4월  1 17:36 ..
drwxr-xr-x@ 2 seongwoo  staff   64  4월  1 17:35 bind-site
drwxr-xr-x@ 3 seongwoo  staff   96  4월  1 17:35 docs
-rw-r--r--@ 1 seongwoo  staff    0  4월  1 17:36 README.md
drwxr-xr-x@ 2 seongwoo  staff   64  4월  1 17:35 site
```

```bash
# 파일 생성, 복사, 이동, 삭제 실습
mkdir cli-lab && cd cli-lab
touch empty.txt
echo "Hello-World" > note.txt

cat note.txt
# Hello-World

cp note.txt note-copy.txt
mv note-copy.txt renamed.txt

cd ..
mv cli-lab cli-practice
rm -f cli-practice/empty.txt
rm -f cli-practice/note.txt
rm -f cli-practice/renamed.txt
rmdir cli-practice
```

---

## 5. 권한 실습

파일·디렉터리 권한 변경(chmod) 실습.

```bash
touch perm_file.txt
mkdir perm_dir

# 제한적 권한 부여
chmod 600 perm_file.txt   # rw-------
chmod 700 perm_dir        # rwx------
```

```bash
ls -l perm_file.txt
# -rw-------@ 1 seongwoo  staff  0  4월  1 17:49 perm_file.txt

ls -ld perm_dir
# drwx------@ 2 seongwoo  staff  64  4월  1 17:50 perm_dir
```

```bash
# 표준 권한으로 복원
chmod 644 perm_file.txt   # rw-r--r--
chmod 755 perm_dir        # rwxr-xr-x
```

```bash
ls -l perm_file.txt
# -rw-r--r--@ 1 seongwoo  staff  0  4월  1 17:49 perm_file.txt

ls -ld perm_dir
# drwxr-xr-x@ 2 seongwoo  staff  64  4월  1 17:50 perm_dir
```

---

## 6. Docker 설치 및 점검

```bash
docker --version
# Docker version 28.5.2, build ecc6942
```

```bash
docker info
```
```
Client:
 Version:    28.5.2
 Context:    orbstack
 Plugins:
  buildx: Docker Buildx v0.29.1
  compose: Docker Compose v2.40.3

Server:
 Server Version: 28.5.2
 Storage Driver: overlay2
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 Architecture: aarch64
 CPUs: 10
 Total Memory: 7.807GiB
```

---

## 7. Docker 기본 운영 명령

### hello-world 실행

```bash
docker run hello-world
```
```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

```bash
docker images
```
```
REPOSITORY    TAG       IMAGE ID       CREATED      SIZE
hello-world   latest    eb84fdc6f2a3   8 days ago   5.2kB
```

```bash
docker ps -a
```
```
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
9317383f6c14   hello-world   "/hello"   37 seconds ago   Exited (0) 36 seconds ago             quirky_grothendieck
```

### 로그/리소스 모니터링 (alpine)

```bash
docker run -d --name log-demo alpine sh -c 'while true; do date; sleep 2; done'
```

```bash
docker logs log-demo
```
```
Wed Apr  1 09:54:11 UTC 2026
Wed Apr  1 09:54:13 UTC 2026
Wed Apr  1 09:54:15 UTC 2026
Wed Apr  1 09:54:17 UTC 2026
Wed Apr  1 09:54:19 UTC 2026
```

```bash
docker stats --no-stream log-demo
```
```
CONTAINER ID   NAME       CPU %   MEM USAGE / LIMIT   MEM %   NET I/O         BLOCK I/O   PIDS
3dfbc3a87399   log-demo   0.26%   916KiB / 7.807GiB   0.01%   1.13kB / 126B   0B / 0B     2
```

```bash
docker stop log-demo
docker rm log-demo
```

---

## 8. Ubuntu 컨테이너 실습

```bash
docker pull ubuntu:24.04
docker run -it --name ubuntu-test ubuntu:24.04 bash
```
```
root@80a53f3ce0ca:/# ls
bin   dev  home  media  opt   root  sbin  sys  usr
boot  etc  lib   mnt    proc  run   srv   tmp  var

root@80a53f3ce0ca:/# echo "hello from ubuntu container"
hello from ubuntu container

root@80a53f3ce0ca:/# pwd
/

root@80a53f3ce0ca:/# exit
```

```bash
docker ps -a
```
```
CONTAINER ID   IMAGE          COMMAND   CREATED          STATUS                      PORTS     NAMES
80a53f3ce0ca   ubuntu:24.04   "bash"    39 seconds ago   Exited (0) 10 seconds ago             ubuntu-test
9317383f6c14   hello-world    "/hello"  12 minutes ago   Exited (0) 12 minutes ago             quirky_grothendieck
```

---

## 9. attach vs exec 차이

```bash
# 백그라운드로 ubuntu 컨테이너 실행
docker run -dit --name ubuntu-keep ubuntu:24.04 bash
```

**attach** — 메인 프로세스의 입출력에 직접 연결 (Ctrl+P, Ctrl+Q로 탈출)

```bash
docker attach ubuntu-keep
```
```
root@df02d42b8365:/# echo "attach session"
attach session
root@df02d42b8365:/# read escape sequence
```

**exec** — 컨테이너 안에서 새로운 프로세스를 추가 실행

```bash
docker exec -it ubuntu-keep bash
```
```
root@df02d42b8365:/# echo "exec session"
exec session
root@df02d42b8365:/# exit
```

```bash
docker stop ubuntu-keep
docker rm ubuntu-keep
```

---

## 10. 커스텀 이미지 제작

### index.html 작성

```html
<!-- site/index.html -->
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
```

### Dockerfile 작성

```dockerfile
FROM nginx:alpine
LABEL org.opencontainers.image.title="workstation-mission-web"
ENV APP_ENV=dev
COPY site/ /usr/share/nginx/html/
EXPOSE 80
```

### 이미지 빌드 및 컨테이너 실행

```bash
docker build -t workstation-web:1.0 .
```
```
[+] Building 5.2s (7/7) FINISHED
 => [1/2] FROM docker.io/library/nginx:alpine    2.4s
 => [2/2] COPY site/ /usr/share/nginx/html/      0.1s
 => exporting to image                           0.0s
 => => naming to docker.io/library/workstation-web:1.0
```

```bash
docker run -d --name workstation-web -p 8080:80 workstation-web:1.0
```

```bash
curl http://localhost:8080
```
```html
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
```

---

## 11. 포트 매핑 접속 증거

- `docs/images/browser-8080.png`
- `docs/images/browser-8081.png`

---

## 12. 바인드 마운트 검증

호스트 파일 변경이 컨테이너에 즉시 반영되는지 확인.

### ① 초기 페이지로 바인드 마운트 컨테이너 실행

```html
<!-- bind-site/index.html (변경 전) -->
<h1>Before Change</h1>
```

```bash
docker run -d --name bind-web -p 8081:80 \
  -v "$(pwd)/bind-site:/usr/share/nginx/html" nginx:alpine
```

```bash
curl http://localhost:8081
```
```html
<!DOCTYPE html>
<html lang="ko">
<head><meta charset="UTF-8"><title>Bind Mount Test</title></head>
<body><h1>Before Change</h1></body>
</html>
```

### ② 호스트에서 파일 수정 후 즉시 반영 확인

```html
<!-- bind-site/index.html (변경 후) -->
<h1>After Change</h1>
```

```bash
curl http://localhost:8081
```
```html
<!DOCTYPE html>
<html lang="ko">
<head><meta charset="UTF-8"><title>Bind Mount Test</title></head>
<body><h1>After Change</h1></body>
</html>
```

> ✅ 호스트 파일 수정 즉시 컨테이너에 반영됨 — 바인드 마운트 정상 동작 확인

---

## 13. Docker 볼륨 영속성 검증

컨테이너를 삭제해도 볼륨의 데이터가 유지되는지 확인.

```bash
# 볼륨 생성
docker volume create mydata
docker volume ls
```
```
DRIVER    VOLUME NAME
local     mydata
```

```bash
# 1차 컨테이너: 볼륨에 데이터 쓰기
docker run -d --name vol-test -v mydata:/data ubuntu:24.04 sleep infinity
docker exec -it vol-test bash -lc 'echo "hello volume" > /data/hello.txt && cat /data/hello.txt'
# hello volume
```

```bash
# 1차 컨테이너 삭제
docker rm -f vol-test
```

```bash
# 2차 컨테이너: 같은 볼륨 마운트 → 데이터 유지 확인
docker run -d --name vol-test2 -v mydata:/data ubuntu:24.04 sleep infinity
docker exec -it vol-test2 bash -lc 'cat /data/hello.txt'
# hello volume
```

> ✅ 컨테이너 삭제 후에도 볼륨 데이터 유지 — 영속성 확인 완료

---

## 14. Git 설정 및 GitHub 연동

```bash
git config --global user.name "big-brother"
git config --global user.email "big-brother@kakao.com"
git config --global init.defaultBranch main
```

```bash
git init
# Initialized empty Git repository in /Users/seongwoo/Documents/sw-codyssey/workstation-mission/.git/

git add .
git commit -m "init : 워크스페이스 구축 실습"
```
```
[main (root-commit) e4a6f59] init : 워크스페이스 구축 실습
 7 files changed, 62 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 README.md
 create mode 100644 bind-site/index.html
 create mode 100644 docs/images/browser-8080.png
 create mode 100644 docs/images/browser-8081.png
 create mode 100644 perm_file.txt
 create mode 100644 site/index.html
```

- GitHub 연동 증거: `docs/images/github-repo.png`

---

## 15. VS Code GitHub 연동 증거

- VS Code GitHub 연동 증거: `docs/images/vscode-github-login.png`

---

## 16. 트러블슈팅

- 트러블슈팅 1 : 
  - 문제 : 'docker info' 실행 시 Docker daemon 연결 실패
  - 원인 가설 : OrbStack이 실행 중이지 않음
  - 확인 : OrbStack이 설치되어 있지 않음
  - 해결 : OrbStack 설치 및 실행 후 'docker info' 재시도

- 트러블슈팅 2 :
  - 문제 : 바인드 마운트 실행 시 경로 관련 오류
  - 원인 가설 : 'bind-site' 폴더가 존재하지 않거나 경로가 잘못됨
  - 확인 : `pwd`, `ls -la`, `ls -la bind-site`로 확인
  - 해결 : 'bind-site' 폴더 생성 후 다시 시도

---

## 17. 학습 정리

### 1) 터미널 기본 명령어

| 명령 | 기능 | 예시 |
|------|------|------|
| `mkdir` | 디렉터리 생성 | `mkdir -p docs/images` (중간 경로 자동 생성) |
| `touch` | 빈 파일 생성 | `touch empty.txt` |
| `echo` | 문자열 출력/파일 쓰기 | `echo "Hello" > note.txt` |
| `cat` | 파일 내용 출력 | `cat note.txt` |
| `cp` | 파일 복사 | `cp note.txt note-copy.txt` |
| `mv` | 파일/디렉터리 이동 또는 이름 변경 | `mv old.txt new.txt` |
| `rm` | 파일 삭제 | `rm -f file.txt` |
| `rmdir` | 빈 디렉터리 삭제 | `rmdir cli-practice` |
| `pwd` | 현재 작업 디렉터리 경로 출력 | `/Users/seongwoo/Documents/...` |
| `ls -la` | 숨김 파일 포함 상세 목록 출력 | 권한, 소유자, 크기, 날짜 표시 |

### 2) 파일 권한 (chmod)

리눅스/macOS 파일 권한은 **소유자(owner) · 그룹(group) · 기타(others)** 3자리 숫자로 표현한다.

| 숫자 | 기호 | 읽기(r) | 쓰기(w) | 실행(x) | 용도 |
|------|------|:---:|:---:|:---:|------|
| `600` | `rw-------` | O | O | X | 소유자만 읽기/쓰기 가능한 비공개 파일 |
| `644` | `rw-r--r--` | O | 소유자만 | X | 일반 파일 (기본값) |
| `700` | `rwx------` | O | O | O | 소유자만 접근 가능한 디렉터리 |
| `755` | `rwxr-xr-x` | O | 소유자만 | O | 일반 디렉터리 (기본값) |

> **핵심 포인트**: 디렉터리는 `x`(실행) 권한이 있어야 `cd`로 진입할 수 있다.

### 3) Docker 기본 개념

```
이미지(Image) → 컨테이너(Container) → 실행(Run)
  (설계도)         (실체화된 인스턴스)     (프로세스)
```

- **이미지**: 읽기 전용 템플릿. Dockerfile로 빌드하거나 Docker Hub에서 pull한다.
- **컨테이너**: 이미지에서 생성된 실행 가능한 인스턴스. 격리된 환경에서 프로세스가 동작한다.
- **레지스트리**: 이미지를 저장하고 공유하는 저장소 (Docker Hub 등).

### 4) Docker 핵심 명령어

| 분류 | 명령 | 설명 |
|------|------|------|
| **이미지** | `docker pull <이미지>` | 레지스트리에서 이미지 다운로드 |
| | `docker build -t <이름>:<태그> .` | Dockerfile로 이미지 빌드 |
| | `docker images` | 로컬 이미지 목록 조회 |
| **컨테이너** | `docker run <옵션> <이미지>` | 새 컨테이너 생성 및 실행 |
| | `docker ps` | 실행 중인 컨테이너 목록 |
| | `docker ps -a` | 전체 컨테이너 목록 (중지 포함) |
| | `docker stop <컨테이너>` | 컨테이너 중지 |
| | `docker rm <컨테이너>` | 컨테이너 삭제 |
| **디버깅** | `docker logs <컨테이너>` | 컨테이너 로그 출력 |
| | `docker stats` | 실시간 리소스 사용량 모니터링 |

#### `docker run` 주요 옵션

| 옵션 | 의미 |
|------|------|
| `-d` | 백그라운드(detached) 실행 |
| `-it` | 인터랙티브 터미널 연결 |
| `--name` | 컨테이너 이름 지정 |
| `-p 호스트:컨테이너` | 포트 매핑 |
| `-v 호스트경로:컨테이너경로` | 바인드 마운트 |
| `-v 볼륨명:컨테이너경로` | 볼륨 마운트 |

### 5) attach vs exec

| 항목 | `docker attach` | `docker exec` |
|------|-----------------|---------------|
| 동작 | 메인 프로세스(PID 1)의 stdin/stdout에 직접 연결 | 컨테이너 내부에 **새로운 프로세스**를 실행 |
| 종료 시 | `exit` 하면 **컨테이너 종료** (메인 프로세스가 끝나므로) | `exit` 해도 **컨테이너 유지** (추가 프로세스만 종료) |
| 탈출 | `Ctrl+P`, `Ctrl+Q` (컨테이너 유지하며 빠져나옴) | `exit` 또는 `Ctrl+D` |
| 용도 | 메인 프로세스의 로그를 실시간 확인할 때 | 디버깅, 파일 확인 등 추가 작업할 때 |

### 6) Dockerfile 기본 구조

```dockerfile
FROM nginx:alpine           # 베이스 이미지
LABEL org.opencontainers.image.title="my-app"  # 메타데이터
ENV APP_ENV=dev             # 환경 변수 설정
COPY site/ /usr/share/nginx/html/  # 호스트 파일 → 이미지로 복사
EXPOSE 80                   # 컨테이너가 사용할 포트 명시
```

| 명령어 | 역할 |
|--------|------|
| `FROM` | 베이스 이미지 지정 (필수, 첫 번째 명령) |
| `LABEL` | 이미지 메타데이터 (작성자, 설명 등) |
| `ENV` | 컨테이너 내부 환경 변수 |
| `COPY` | 호스트 파일을 이미지에 복사 |
| `EXPOSE` | 외부에 노출할 포트 선언 (실제 매핑은 `-p` 옵션) |

### 7) 포트 매핑

```
호스트:8080  ──→  컨테이너:80 (nginx)
```

- `-p 8080:80` : 호스트의 8080 포트로 들어온 요청을 컨테이너의 80 포트로 전달한다.
- `curl http://localhost:8080`으로 접속하면 컨테이너 내부의 nginx가 응답한다.

### 8) 바인드 마운트 vs 볼륨

| 항목 | 바인드 마운트 (Bind Mount) | 볼륨 (Volume) |
|------|---------------------------|---------------|
| 형식 | `-v /호스트/경로:/컨테이너/경로` | `-v 볼륨명:/컨테이너/경로` |
| 관리 | 호스트 파일시스템에 직접 매핑 | Docker가 관리하는 별도 영역 |
| 용도 | 개발 중 실시간 코드 반영 | 데이터 영속성 (DB, 로그 등) |
| 특징 | 호스트 파일 변경 즉시 반영 | 컨테이너 삭제해도 데이터 보존 |
| 이식성 | 호스트 경로에 의존 (이식성 낮음) | Docker가 관리 (이식성 높음) |

### 9) Git 기본 설정 및 워크플로

```bash
# 최초 설정
git config --global user.name "이름"
git config --global user.email "이메일"
git config --global init.defaultBranch main

# 기본 워크플로
git init                    # 저장소 초기화
git add .                   # 변경 파일 스테이징
git commit -m "메시지"       # 커밋
git remote add origin <URL> # 원격 저장소 연결
git push -u origin main     # 원격에 푸시
```

| 명령 | 역할 |
|------|------|
| `git init` | 현재 디렉터리를 Git 저장소로 초기화 |
| `git add` | 워킹 디렉터리 → 스테이징 영역으로 이동 |
| `git commit` | 스테이징 영역의 변경사항을 저장소에 기록 |
| `git push` | 로컬 커밋을 원격 저장소에 업로드 |
