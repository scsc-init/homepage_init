# ?회차 회의  
> 2025-07-04

## 참여자

### Frontend
- 강명석  

### Backend / Database
- 강명석  

---

## 논의사항

### FE Readme 및 페이지 문서화
- **README.md 최신화**
- [ ] 최신개정일, 작성자가 적혀있지 않습니다. 작성자는 `박성현`으로 합시다.
- [ ] .env에 무슨 값이 있어야 하는지 적혀있지 않습니다.
- BE 쪽 Readme 참조해서 작성해보도록 합시다.
- **짜잘한거**
- [ ] favicon 설정해주세요

### BE 짜잘한거
- insert_sample_articles.sh에 문제가 있습니다. 정확히는 얘 문제는 아니고, 관련된 문제
- 0번 article을 생성해놓고서, statics에 해당하는 글을 작성하지 않습니다. static에 0.md가 없으니까 서버가 0.md를 읽지 못하고 에러가 뜨는 문제가 있습니다. 해결해주세요
- assert_user_permission 에 관련해서 CORS 문제가 터집니다. `/api/executives/*` 경로로 브라우저가 요청을 보내면 CORS가 터짐. 해결해주세요. 지난번처럼 `CORS_ALL_ACCEPT` 확인하고 TRUE면 all accept하는 방향으로 개발해주세요

### FE Client Side Fetch 분리
- 지금 Client Side의 `@\app\executive\ScscStatusPanel.jsx`에서 몇가지 `api/executives` 계열 정보를 fetch 해오는 것 같은데, 이제 이걸 다 Server Side로 돌릴겁니다.
- 관련 정보는 `page.jsx`에서 로드하고 로드한 정보를 매개변수로 넘기는 방식으로 작성해주세요.
- `ScscStatusPanel`의 `${getBaseUrl()}/api/executive/scsc/global/status`의 경우에, FE 서버에서 별도로 `@/app/api/executive/scsc/global/status/route.js` 같은걸 만들어서, 거기에서 요청을 날리도록 만듭시다. 그러니까 FE 웹페이지 > FE 서버 route.js > BE Main 서버 형태로 가는것.
- 마찬가지로 `CreateBoardArticleClient` 페이지에서 BE Main 서버로 바로 Fetch 하는데, 별도의 `@/app/api/article/create/route.js` 같은 걸 만들어서, 거기에서 요청을 날리도록 만듭시다.
- 확인해보고 비슷한거 있으면 바꿉시다.
- 이것뿐만 아니라, 앞으로도 이제 FE 브라우저 페이지에서 BE Main으로 바로 쏘는 요청은 FE 서버를 한 번 거치게 만들겁니다. 참고해주세요

### Bot 서버 짜잘한 것
- `.devcontainer` 폴더는 굳이 없어도 될 것 같고요 (왜냐하면 backend 측에도 없으니까), docker-compose 파일 루트에다가 작성해주세요. 그리고 Readme에 실행방법 써 둡시다.
- 이제 레포를 합칠거니까 docs에 bot.md 내용도 있어야 합니다. 옮겨주세요
- 두 가지 완료되면 `discord` 레포지토리는 private archive 하겠습니다.
- 메세지 쓸 때, 임베드 넣을 수 있게 해주세요

### 회원의 Discord ID 매핑
- **SCSCBotConnector**
- 우선 디스코드 봇에 명령어 하나가 요구됩니다. 그 명령어를 `/enroll` 이라고 합시다. 이름은 바뀌어도 됩니다.
- 그리고 SCSCBotConnector은 함수 f(discordId:, discordName:, studentNo:string)들을 저장할 수 있는 빈 리스트 `enroll event listeners`를 가집니다. 여기에 함수를 추가할 수도, 리스트를 Clear 할 수도 있어야 합니다.
- `/enroll {학번}` 명령은 발생 시, 리스트에 있는 모든 함수를 실행합니다.
- 이런걸 있어보이게 Observer Pattern 이라고 합니다.
- **BotServer**
- 봇 서버는 봇을 실행하는 시점에서, 벡엔드 서버에게서 모든 권한의 영문 이름을 가져온 후, 해당 이름으로 역할을 생성합니다. 만약 이미 해당 역할이 존재한다면, 생성을 하지 않습니다.
- 봇 서버는 봇을 실행하는 시점에서, 이벤트 리스너에 함수 하나를 추가합니다. 그 함수를 `enroll_user` 라고 합시다. 이름은 바뀌어도 됩니다.
- Main BE 서버에 로그인하는 컨트롤이 필요합니다. 이 컨트롤은 최초 실행시 자동으로 호출되어야합니다. 그리고 이거 관련해서, 로그인 되어 있는지 확인하는 GET 요청, 로그인을 요청하는 (=컨트롤을 call 하는) POST 요청이 있어야 합니다*. 로그인 id와 비밀번호는 .env에 작성되어야 합니다.
- 이 `enroll_user`는 벡엔드 서버에 `isUserExist`를 확인하고, 만약 존재한다면, 백엔드 서버에 (discordId, discordName)을 등록합니다. 또한 `isUserExist`가 날라오면 그 유저의 권한이 같이 넘어올텐데(휴회원 준회원 정회원 OB 운영진 회장단), 그 권한에 대항하는 역할도 할당합시다.
- 따라서, 봇 서버도 x_api_secret 값을 가져야 합니다. .env에다가 박아놓으세요
- **MainBE Server**
- 모든 영문 유저 권한 이름을 가져오는 함수가 있는 걸로 알고는 있는데, 한 번 확인해봅시다.
- Bot BE server의 계정을 삽입하는 sh가 필요합니다.

* 이 부분 개발이 너무 부담된다면, REST 는 만들지 말고 로그인을 요청하는 AQMP 요청만 만듭시다.

---

## 공지사항

- sig장(강명석)이 네이버라는 회사에 출근을 하게 되었습니다.
- 이때문에 앞으로 본인은 오프라인 참가가 힘들 예정입니다. 참고하십쇼
- 금요일 시간을 미룰래 vs 디스코드에서 여고생 PM을 볼래

---

## 7월 7일까지 할 것

**박성현**
- `FE Readme 및 페이지 문서화` 처리

**이한경**
- `FE Client Side Fetch 분리` 처리
- `FE Readme 및 페이지 문서화` 처리
- 외 코드 리뷰 및 머지

**윤영우**
- `Bot 서버 짜잘한 것` 처리
- `회원의 Discord ID 매핑` 의 BE 처리

**황민기**
- `회원의 Discord ID 매핑` 의 봇 처리
