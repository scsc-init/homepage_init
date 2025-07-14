# ?회차 회의  
> 2025-07-11

## 참여자

### Frontend
- 박성현
- 강명석  

### Backend / Database
- 이한경
- 윤영우
- 황민기
- 강명석  

---

## 논의사항

### BE 서버 배포 완료
- Bot setver, MMain BE server를 배포하였다.
- 배포 후 main에다가 0.1.0의 tag를 달았다.
- nginx config도 완료

### bot 서버 문제
- `Error: User discord id enroll failed with exception: 403 Forbidden (error code: 50013): Missing Permissions` 문제가 뜸
- /enroll 시 역할이 부여 안 되는 로직이 없음
- 어쨌든 해결함

### BE 서버 문제
- 유저가 discord id가 없을 때의 에러 처리가 필요. 일단 이제 에러 메세지를 end user가 볼 거기 때문에, 무슨 에러인지 한국어로 잘 설명해줘야 합니다.
- discord id가 없으면, 일단 무시하고 생성할 수 있어야 합니다, 그리고 시그 생성할 때에도 다시 확인 후, 그때에도 없으면 무시하는 로직이 필요합니다.

### FE 서버 배포
- 일단 vercel에다가 띄우기는 함
- 잘 안 됨 (특히 로그인이)
- 신박한 fetch 에러

### FE 프론트
- OAuth 로그인에 NextAuth 도입하기

---

## 7월 18일 오전까지 할 것

**이한경**
- `BE 서버 문제` 해결
- 시그 신청, 피그 신청 만들기
  
**황민기**
- `article tbl`에 대해서 index 비슷하게 만들고, init_db.sh에 인덱스 정의문 추가해주세요
- comment 없을 때 404 반환하는 거 다시 만들어주세요
- 리뷰 resolve 하고 read 부분 코드 구현하기

**윤영우**
- QC
- 모든 행동 다 해보고, 에러 있으면 기록하고, issue 남기기
- 그리고 엥간하면 문제 해결해보기

**박성현**
- `OAuth 로그인에 NextAuth 도입하기` 처리
- 수정사항 문서화하기, 후보군 중에 뭐 선택할지 미리 대충 결정해놓기
