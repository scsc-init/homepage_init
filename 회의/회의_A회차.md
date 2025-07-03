# ?회차 회의  
> 2025-07-04

## 참여자

### Frontend
- 강명석  

### Backend / Database
- 강명석  

---

## ?월 ??일까지 한 것 및 특이사항

### Frontend

### Backend / Database

---

## 논의사항

### FE Readme 및 페이지 문서화
- **README.md 최신화**
- [ ] 최신개정일, 작성자가 적혀있지 않습니다.
- [ ] .env에 무슨 값이 있어야 하는지 적혀있지 않습니다.
- BE 쪽 Readme 참조해서 작성해보도록 합시다.
- **짜잘한거**
- [ ] favicon 설정해주세요

### BE 짜잘한거
- insert_sample_articles.sh에 문제가 있습니다. 정호가히는 얘 문제는 아니고, 관련된 문제
- 0번 article을 생성해놓고서, statics에 해당하는 글을 작성하지 않습니다. static에 0.md가 없으니까 서버가 0.md를 읽지 못하고 에러가 뜨는 문제가 있습니다. 해결해주세요
- assert_user_permission 에 관련해서 CORS 문제가 터집니다. `/api/executives/*` 경로로 브라우저가 요청을 보내면 CORS가 터짐. 해결해주세요. 일단 임시로 지난번처럼 `CORS_ALL_ACCEPT` 확인하고 TRUE면 all accept하는 방향으로 개발

### FE Client Side Fetch 분리
- 지금 Client Side의 `@\app\executive\ScscStatusPanel.jsx`에서 몇가지 `api/executives` 계열 정보를 fetch 해오는 것 같은데, 이제 이걸 다 Server Side로 돌릴겁니다.
- 관련 정보는 `page.jsx`에서 로드하고 로드한 정보를 매개변수로 넘기는 방식으로 작성해주세요.
- `ScscStatusPanel`의 `${getBaseUrl()}/api/executive/scsc/global/status`의 경우에, FE 서버에서 별도로 `@/app/api/executive/scsc/global/status/route.js` 같은걸 만들어서, 거기에서 요청을 날리도록 만듭시다. 그러니까 FE 웹페이지 > FE 서버 route.js > BE Main 서버 형태로 가는것.
- 마찬가지로 `CreateBoardArticleClient` 페이지에서 BE Main 서버로 바로 Fetch 하는데, 별도의 `@/app/api/article/create/route.js` 같은 걸 만들어서, 거기에서 요청을 날리도록 만듭시다.
- 이것뿐만 아니라, 앞으로도 이제 FE 브라우저 페이지에서 BE Main으로 바로 쏘는 요청은 FE 서버를 한 번 거치게 만들겁니다. 참고해주세요

---

## ?월 ??일까지 할 것

### Frontend  

### Backend / Database
