# ?회차 회의  
> 2025-07-07

## 참여자

### Frontend
- 강명석  

### Backend / Database
- 이한경
- 윤영우
- 강명석  

---

## 논의사항

### 가배포하기
- MainBE. 새로 생기는 서버에다가 배포합시다. 최초 배포시, 제 이메일 <zizonms@snu.ac.kr> 그리고 한경님 이메일이 회원에 관리자로 있어야 합니다.
- BotServer. 마찬가지로 새로 생기는 서버에다가 배포합시다. 
- 그리고 nginx 써서 조절합시다.
- FE. vercel에다가 배포합시다. vercel에다가 배포하는 이유는 ssl을 별도설정 안 해줘도 제공해주니까. 나중에는 결국 바꾸기는 해야 합니다. <- google api에서 도메인 추가를 해야할 것. Fwd -> 윤영우
- 이 배포 준비를 위해서, 미리 docker-compose.yml 준비해주시고, nginx 배워주세요

### develop branch
- develop branch를 만들겁니다.
- 앞으로 모든 PR은 develop branch에다가 하도록 합시다.
- 지금부터 main branch는 release 용이기 때문에, 큰 업데이트 또는 핫픽스가 아니면 건들지 않습니다.
- 또한, 배포 시점의 main branch에다가 `0.1.0` tag를 달아야 합니다.

### 댓글 관련 기능 BE
- 댓글 스키마 검토 받아주시고 Fwd: 이한경
- `회의_9회차`를 참고하십쇼

### 새로운 FE 팀원
- Yoon Yeoung Woo
- FE 배포 + 짜잘한거
- env에서 NEXT_PUBLIC 빼기
<!-- - 단과대+과 다롭다운에서 단과대 선택, 과 선택으로 드롭다운 2개로 나누기 -->

### BE Bot server 연결
- Sig 생성 및 Pig 생성에 대응해야 합니다
- User 권한 변동에 대응해야 합니다
- 공지사항 게시판에 공지글이 올라가면 디스코드에도 올라가야 합니다
- 이것들에 관련된 discord bot 매핑해주세요.

---

## 7월 11일 오전까지 할 것

**이한경**
- `가배포하기` 처리
- `develop branch` 처리
- ip 신청
  
**황민기**
- `댓글 관련 기능 BE` 처리

**윤영우**
- `새로운 FE 팀원` 처리
- `BE Bot server 연결` 처리
