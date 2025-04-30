# 서울대학교 중앙 컴퓨터 동아리 SCSC <br> 홈페이지 기획 및 개발 명세서 요약

**버전:** 4.1.0  
**최신개정일:** 2025-04-29

---

## A. Global

- 모든 프로그래밍 문서는 D2Coding을 기준으로 작성합니다.
- 글꼴로 인해 문제가 생긴다면 D2Coding을 기준으로 합니다.
- (홍보) 개발 시 가급적 D2Coding 사용을 권장합니다.

## B. 프로젝트 개요

**프로젝트명:**  
서울대학교 중앙 컴퓨터 동아리 SCSC의 메인 홈페이지 구축

### 핵심 기능

- **동아리 외부 홍보:** SEO를 잘 한다. 기깔나는 디자인을 만든다.  
- **학기별 회원 모집:** 회원 시스템이 잘 돌아가야 한다. 회비 가입도 잘 확인되어야 한다. 아마 카톡봇과 디코봇도 있어야 할 것이다.  
- **SIG/PIG 활동 관리:** SIG와 PIG 관리를 위한 시스템이 (잘) 돌아가야 한다. DB 덩어리.  
- **동아리 관리:** 저 세 시스템을 잘 관리할 수 있는 admin 페이지가 있어야 한다.  

### 기술 스택 (예상)

- 프론트엔드: Next.js 등. 고민해서 결정해야 함
- 백엔드: Flask 등. 고민해서 결정해야 함
- Database: 고민해서 결정해야 함
- MMS 전송 시스템
- 디스코드 초대 봇 / 카카오톡 봇

### 사용자 구분

- **비회원:** DB 미등록, 외부 페이지 접근 가능
- **회원:** 내부 페이지 접근 가능, 학기마다 권한 갱신 필요
- **임원(관리자):** 관리자 페이지 접근 가능
- **회장단:** 회장 권한

- **후원자:** 필요시 도입 일단은 Hold. 지훈님 협의

### 홈페이지 주요 경로

- `/` → 메인 페이지  
- `/members` → 운영진 소개  
- `/SCSC` → 동아리 소개  

- `/login` → 로그인  
- `/dashboard` → 로그인 후 메인  
- `/join` → 상시 시즌 가입 폼  
- `/join/{year}` → 정규 시즌 가입 폼  

- `/me` → 마이페이지  
- `/boards`, `/boards/:id` → 공지사항  
- `/album`, `/album/:id` → 행사 사진 (필요성 논의)  

- `/sig`, `/sig/create` → SIG 목록 및 신청/개설  
- `/pig`, `/pig/create` → PIG 목록 및 신청/개설  
- `/admin` 이하 → 관리자 페이지  

### API 주요 경로

- `/api/database/...` → DB API  
- `/api/sig/...` → SIG 관련  
- `/api/pig/...` → PIG 관련  
- `/api/kakao/...` → 카카오톡 봇  
- `/api/discord/...` → 디스코드 봇  

## C. 소개 페이지

- 첫 방문 시 외부 홍보 페이지 노출 (oopy.io 스타일)
- 동아리 소개, 활동 사진, 모집 안내, 운영진 소개
- 외부 협업(SCPC, SKYST 등) 노출

## D. 회원 시스템

### 가입 절차

1. 가입 신청 (비회원 or 만료 회원)
2. MMS/카카오톡 전송 → 가입 대기
3. 회비 입금 확인
4. 정회원 등록
5. 카카오톡/디스코드 초대

- Google OAuth 사용 권장 (@snu.ac.kr 강제)  
- 계정 관리 간편화  

### 가입 정보

- 이름: string  
- 학번: `{number}-{number}`  
- 학적 상태: 학부생 / 대학원생 / 졸업생  
- 학과: 드롭다운 선택  

### 회원 DB 예시

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(100),
    phone VARCHAR(20),
    major VARCHAR(100),
    student_id VARCHAR(20),
    role ENUM('user', 'admin', 'moderator') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('active', 'pending', 'banned') DEFAULT 'pending',
    last_login TIMESTAMP,
    login_provider VARCHAR(50),
    oauth_id VARCHAR(255)
);
```

## E. SIG / PIG 운영 시스템

### 개설 기능

- 마크다운 기반 소개글 작성 가능 (katex 포함)
- 개설자는 모집 마감 전까지 내용 수정 가능
- SIG장 직위 양도 가능

### 신청 기능

- 사전 등록 기간 신청 및 취소 가능
- 마감일 이후 자동 비활성화
- 신청 그룹 열람 및 신청/취소 기능

## F. 관리자 기능

- 가입자 승인/거절, 권한 변경
- 대량 메일 발송 (필터링 포함)
- SIG/PIG 마감일 설정
- 날짜 기준 통계 대시보드

### 통계

- 오늘 기준 작년과 비교
- 학과별, 권한별 필터
- 라인차트/바차트/파이차트 지원
- CSV 내보내기 기능

# G. (기대하는) 임시 역할분담

- 프론트: 디자인 **잘** 해야 함.
- 백엔드, Database: 사실상 DB 관리. DB 잘 해야 함.
- 외부API: 카카오톡 봇, 디스코드 봇, MMS 전송, 회비 입금 확인