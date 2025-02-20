<p align="center">
    <img width="200px;" src="https://raw.githubusercontent.com/woowacourse/atdd-subway-admin-frontend/master/images/main_logo.png"/>
</p>
<p align="center">
  <img alt="npm" src="https://img.shields.io/badge/npm-%3E%3D%205.5.0-blue">
  <img alt="node" src="https://img.shields.io/badge/node-%3E%3D%209.3.0-blue">
  <a href="https://edu.nextstep.camp/c/R89PYi5H" alt="nextstep atdd">
    <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fedu.nextstep.camp%2Fc%2FR89PYi5H">
  </a>
  <img alt="GitHub" src="https://img.shields.io/github/license/next-step/atdd-subway-service">
</p>

<br>

# 인프라공방 샘플 서비스 - 지하철 노선도

<br>

## 🚀 Getting Started

### Install
#### npm 설치
```
cd frontend
npm install
```
> `frontend` 디렉토리에서 수행해야 합니다.

### Usage
#### webpack server 구동
```
npm run dev
```
#### application 구동
```
./gradlew clean build
```
<br>

## 미션

* 미션 진행 후에 아래 질문의 답을 README.md 파일에 작성하여 PR을 보내주세요.

### 0단계 - pem 키 생성하기

1. 서버에 접속을 위한 pem키를 [구글드라이브](https://drive.google.com/drive/folders/1dZiCUwNeH1LMglp8dyTqqsL1b2yBnzd1?usp=sharing)에 업로드해주세요
- 업로드 했습니다.

2. 업로드한 pem키는 무엇인가요.
- ingus26.pem

### 1단계 - 망 구성하기
1. 구성한 망의 서브넷 대역을 알려주세요
- 대역 : web) ingus26-public-a | 192.168.13.0/26
        web) ingus26-public-c | 192.168.13.64/26
        db) ingus26-internal-a | 192.168.13.128/27
        관리망) ingus26-manage-a | 192.168.13.160/27


2. 배포한 서비스의 공인 IP(혹은 URL)를 알려주세요

- URL : http://3.39.53.16:8080/
        http://인쿠26.메인.한국:8080/

- 서비스 시작 명령어 : nohup java -jar ./nextstep/infra-subway-deploy/build/libs/subway-0.0.1-SNAPSHOT.jar 1> web.log 2>&1

---

### 2단계 - 배포하기
1. TLS가 적용된 URL을 알려주세요

- URL : https://인쿠26.메인.한국/

- 서비스 시작 명령어 : nohup java -jar -Dspring.profiles.active=prod ~/nextstep/infra-subway-deploy/build/libs/subway-0.0.1-SNAPSHOT.jar & 

---

### 3단계 - 배포 스크립트 작성하기

1. 작성한 배포 스크립트를 공유해주세요.
- deploy.sh


