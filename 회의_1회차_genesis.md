# 1회차 회의

## 역할 분담

### Frontend
오현우
박성현
강명석

### Backend / Database
이한경
황민기
강명석

## 참여자

대면: 
광역 25 황민기 - Python으로 웬만한건 다 했음 (Flask 해봤음). AI/PS 적당히 함. 웹은 HTML/CSS/JS 의 기본 정도 하는 듯, SQLite  
첨융 25 이한경 - Web 많이 했음. React (+vercel로 배포), Node.js KOA (+nginx로 배포), RN 써서 앱 배포 함. PS 적당히 함. Python은 Numpy랑 Pandas 써봄. Android Studio 공부 중. mongoDB  
광역 25 박성현 - JS, React 함. 기획 인력 쪽으로 활동 좀 함. mariaDB  
컴공 24 강명석 - 뭔가 문제가 터지면 저를 부르세요.  
컴공 23 오현우 - 1학년 때 개인적으로 React를 배웠고, 작년에 INIT 활동을 하면서 next.js를 배웠습니다. 그 외에 백엔드 경험은 전무하지만, 민기님과 마찬가지로 이런저런 일로 파이썬을 사용해 본 경험은 있습니다. 프론트엔드밖에 모르지만 그래도 INIT 작년에 열심히 참여했어서 작년 활동에 대해서 이런저런 궁금한 거 여쭤보시면 알려드리겠습니다!  
광역 25 이유진 - React, Node.js 해봄. 거의 초보

## 기술 스택
### Front
Next.js 
- 사유 1: 압도적 다수가 써봤다 / 금방 쓸 수 있다
- 사유 2: SEO가 쉽다. vercel로 배포 딸깍 가능

OAuth2를 배우자
- 지훈님 컨펌을 받아야 하지 않을까?
- 모든 유저가 유니크한 @snu.ac.kr을 가지고 있는데, 이걸 쓰는게 좋지 않음?
- 비밀번호 필요없음 = Ctypto 필요 없음, 정보보호법 안 지켜도 됨.

### Backend

/api/pig/create POST

FastAPI
- 사유 1: 두 분의 공통점 (황민기, 이한경님)
- 사유 2: 와 Python!! 와 의사코드!!

Docker
- Docker를 가능하면 쓰셨으면 좋겠다.
- 학습적인 목표: 2학년때까지는 꺼드럭거릴 수 있슴. (나. Docker. 써봄)
- 나중에 배포할 때 문제 터질 확률 낮음
- 지금 당장은 말고... 얼개가 잡히면 도입을 해보자

### Database

SQLite
스키마는 알아서 정하세요

회원 DB
- OAuth2 사용 예정.
SIG DB
PIG DB

정하고 저한테 얘기하세요
- SIG PIG 소개 페이지 저장하는 별도 저장소가 있어야 함


## 일정 (회의 얼마나 자주할까, 언제까지 뭘 구현할까)

1주 간격. 월요일 18시 15분
예외적으로, 다음 회의는 12일

# 5월 12일까지 할 것

### Frontend

Github 코드를 읽어옵니다. 살릴 코드를 찾아봅니다.

아무거나 살려 오시면 감사하겠음니다.

성현님이랑 논의해서 구현 하고, 문서화까지 해주시면 정말 감사하겠습니다.

### Backend / Database

Fast API와 SQLite를 배워오십쇼.

회원 DB 정하고, 회원 CRUD 기능 구현, api 경로 만들어서 프론트에 전달해주세요
/api/user/create, ..., /api/user/update, 등등등등

디스코드 봇을 만드는데, api/ 경로 넣어서 만들어주세요.: /api/discord/invite 이런 경로 대충 만들어서 json으로 회원 정보 날리면 그 회원 채널에 초대가 되었으면 좋겠다.