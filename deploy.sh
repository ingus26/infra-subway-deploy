#!/bin/bash

## 변수 설정
txtrst='\033[1;37m' # White
txtred='\033[1;31m' # Red
txtylw='\033[1;33m' # Yellow
txtpur='\033[1;35m' # Purple
txtgrn='\033[1;32m' # Green
txtgra='\033[1;30m' # Gray

echo -e "${txtylw}=======================================${txtrst}"
echo -e "${txtgrn}  << 스크립트 🧐 >>${txtrst}"
echo -e "${txtylw}=======================================${txtrst}"

EXECUTION_PATH=$(pwd)
BRANCH=$1
PROFILE=$2

echo -e "${PATH}"

## 조건 설정
 if [[ $# -ne 2 ]];
 then
    echo -e "${txtylw}=======================================${txtrst}"
    echo -e "${txtgrn}  << 스크립트 🧐 >>${txtrst}"
    echo -e ""
    echo -e "${txtgrn} $0 브랜치이름 ${txtred}{ prod | dev }"
    echo -e "${txtylw}=======================================${txtrst}"
    exit
 fi

## github branch 변경 확인
function check_df() {
  git fetch
  master=$(git rev-parse $BRANCH)
  remote=$(git rev-parse origin $BRANCH)

  if [[ $master == $remote ]]; then
    echo -e "[$(date)] Nothing to do!!! 😫"
    exit 0
  fi
}

## 저장소 pull
function pull() {
  echo -e ""
  echo -e ">> Pull Request ${BRANCH}🏃♂️ "
  git pull ${BRANCH}
}

## gradle build
function build() {
  echo -e ""
  echo -e ">> Build Request 🏃♂️ "
  ./gradlew clean build
  JAR_NAME=$(basename -- ./build/libs/*.jar)
  echo -e ">> JAR NAME : ${JAR_NAME}"
}

## 프로세스 pid를 찾는 명령어
function find_pid() {
  PID=$(lsof -t ${JAR_NAME})

  if [[ -z "${PID}" ]]; then
    echo -e ""
    echo -e ">> process not found 🏃♂️ "
  else
    echo -e ""
    echo -e ">> process found ${PID} 🏃♂️ "
    kill_pid
  fi
}

## 프로세스를 종료하는 명령어
function kill_pid(){
    echo -e ""
    echo -e ">> kill pid -9 ${PID} 🏃♂️ "
    kill -9 ${PID}
    sleep 5
}

## 실행하는 명령어
function run(){
    echo -e ""
    echo -e ">> run jar -9 ${JAR_NAME} 🏃♂️ "

    if [[ -z "./logs" ]]; then
      mkdir logs
    fi

    nohup java -jar -Dspring.profiles.active=${PROFILE} ./build/libs/${JAR_NAME} > ./logs/nohup.out 2>&1 &
}

check_df
pull
build
find_pid
run
