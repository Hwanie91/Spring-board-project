# Spring-board-project
> 스프링 게시판 프로젝트 입니다.

![메인 화면](https://user-images.githubusercontent.com/102968499/215312578-dba69bc8-5690-4f78-99bd-edcf3fac0286.PNG)


## 목차
- [들어가며](#들어가며)
  - [프로젝트 소개](#1-프로젝트-소개)    
  - [프로젝트 기능](#2-프로젝트-개요)    
  - [사용 기술](#3-사용-기술)   
     - [백엔드](#3-1-백엔드)
     - [프론트엔드](#3-2-프론트엔드)
  - [실행 화면](#4-실행-화면)


- [구조 및 설계](#구조-및-설계)
  - [패키지 구조](#1-패키지-구조)
  - [DB 설계](#2-db-설계)
  - [API 설계](#3-api-설계)

- [개발 내용](#개발-내용)

- [마치며](#마치며)
  - [프로젝트 보완사항](#1-프로젝트-보완사항)

## 들어가며
### 1. 프로젝트 소개

스프링 프레임워크를 습득할 수 있는 기본적인 CRUD 게시판을 만들고, 기능을 점진적으로 발전시킨다.   

### 2. 프로젝트 개요
- 프로젝트 명칭 : commu board
- 개발 인원 : 1명
- 개발 기간 : 2022.12.19 ~ 2023.01.26
- 주요기능 :
- **게시판 -** CRUD 기능, 조회수, 페이징, 타입별 검색 처리, 트랜잭션 처리
- **사용자 -** Security 로그인, 자동 로그인, 로그아웃 시 쿠키삭제
- **댓글 -** CRUD 기능, 페이징
- 개발 툴 : Eclipes 2021-03
- 형상관리 툴 : GitHub

### 3. 사용 기술

#### 3-1 백엔드

##### 주요 프레임워크 / 라이브러리
- Java 1.8
- Spring 5.0.7.RELEASE
- junit 4.2
- Spring Security
- mybatis

##### Build Tool
- Maven

##### DataBase
- MySQL 8.0.30

#### 3-2 프론트엔드
- Html/Css
- JavaScript
- jQuery
- Bootstrap template

### 4. 실행 화면
  <details>
    <summary>게시글 관련</summary>   
       
    
  **1. 게시글 전체 목록**   
     
  전체 목록을 페이징 처리하여 조회할 수 있다.   
  ![게시글 전체 목록](https://user-images.githubusercontent.com/102968499/215327618-bdbb814f-1793-4275-9ac2-3a61ef6fc96a.PNG)
  트랜잭션 처리를 통해 제목 옆에 댓글 수가 실시간으로 표시된다.
   
  **2. 게시글 등록**   
  ![게시글 등록](https://user-images.githubusercontent.com/102968499/215327697-4dc07431-6636-433c-beff-116ff74f34f4.PNG)   
  로그인 한 사용자만 새로운 글을 작성할 수 있고, 작성 후 목록 화면으로 redirect한다.   
     
  **3. 게시글 상세보기**   
  ![게시글 상세(1)](https://user-images.githubusercontent.com/102968499/215329036-a0c0b2bd-948e-4e51-8639-39ed9475e72b.PNG)
  ![게시글 상세(2)](https://user-images.githubusercontent.com/102968499/215329122-a79fa43b-a108-4cef-95bf-8068ef845141.PNG)
  본인이 작성한 글만 수정 및 삭제가 가능하다.   
     
  **4. 게시글 수정 화면**   
  ![게시글 수정(1)](https://user-images.githubusercontent.com/102968499/215329408-da8bd170-1d85-41cd-ab92-5fbb7a31bab0.PNG)
  ![게시글 수정(2)](https://user-images.githubusercontent.com/102968499/215329412-ca29284a-e657-4983-b982-e2d6401d293e.PNG)
  ![게시글 수정(3)](https://user-images.githubusercontent.com/102968499/215329417-8e4a8bcf-bd34-4767-969e-831d03aa122c.PNG)
  제목과 내용만 수정할 수 있게 하고, Confirm으로 수정 성공여부를 확인 후 게시글 전체 화면으로 redirect 한다.      
  
  **5. 게시글 삭제 화면**   
  ![게시글 수정(1)](https://user-images.githubusercontent.com/102968499/215329785-50548b43-35e6-4c17-ba4e-315cd67df36b.PNG)
  ![삭제 성공](https://user-images.githubusercontent.com/102968499/215329747-19f5e62d-42c9-45e6-9134-87b52d0726af.PNG)
  ![삭제 후](https://user-images.githubusercontent.com/102968499/215329846-1c788446-8563-47b6-b087-5d35fcf90757.PNG)
  삭제 후 전체 목록 리스트 화면으로 redirect 하고 Confirm으로 삭제 성공 여부를 알린다.   
  
  **6. 게시글 검색 화면**   
  ![게시글 검색(1)](https://user-images.githubusercontent.com/102968499/215330602-d1b7333c-cd88-4735-82d6-30babcda1b62.png)
  검색 키워드에 포함된 글을 모두 보여준다.   
     
  **6-1. 게시글 검색 후 페이징 화면**   
  ![게시글 검색(2)](https://user-images.githubusercontent.com/102968499/215330606-098f8c47-17f9-40f8-a820-7f1d9f6a045d.png)   
  검색된 게시글이 많을 경우 다음과 같이 페이징 처리되어 조회할 수 있다.   
     
  </details>
  <br/>   
  
  <details>
    <summary>회원 관련</summary>   
     
  **1. 로그인 화면**   
  ![로그인(1)](https://user-images.githubusercontent.com/102968499/215331894-92abfae4-14a8-47a7-a925-2594c33c8c55.png)
  ![로그인(2)](https://user-images.githubusercontent.com/102968499/215332234-1117300e-5c4a-4b1f-b4ae-4869c9f8a519.png)  
  로그인 실패시 에러 메시지가 나오고, 로그인에 성공하면 메인 화면으로 redirect 한다.
  자동 로그인에 체크하면 쿠키만료 전까지 로그인 유지.
     
  **2. 로그아웃 화면**   
  ![로그아웃](https://user-images.githubusercontent.com/102968499/215331289-8bb8f763-e48a-4e88-99dd-4be3b6818a06.png)    
  ![로그아웃2](https://user-images.githubusercontent.com/102968499/215331358-fac992a3-4d35-4d59-a7b2-ec63c6bbbe74.png)
  로그아웃 성공 시 로그인 화면으로 redirect 한다.
  
  **3. 에러 화면**   
  ![에러 페이지](https://user-images.githubusercontent.com/102968499/215332783-49516d6c-bb0e-40c2-866e-c8d49eaa7b65.PNG)
         
  </details>
  <br/>   
  
  <details>
    <summary>댓글 관련</summary>   
       
  **1. 댓글 작성 화면**   
  ![댓글 작성(1)](https://user-images.githubusercontent.com/102968499/215332954-5e09565f-6304-405c-be48-c8287084cc53.PNG)
  미로그인 사용자 화면
  ![댓글 작성(2)](https://user-images.githubusercontent.com/102968499/215333175-8b9d00b2-ae0a-4a82-9611-68b33c1e1e06.PNG)
  ![댓글 작성(3)](https://user-images.githubusercontent.com/102968499/215333407-cf538e6d-f521-419d-bbd2-d12f8537b790.PNG)
  ![댓글 작성(4)](https://user-images.githubusercontent.com/102968499/215333412-7daafecb-c33a-4d4f-9f04-ce9d4e52f08d.PNG)
  ![댓글 작성(5)](https://user-images.githubusercontent.com/102968499/215333415-cc86317f-4bd1-4e02-9e10-a725c6c5fa16.PNG)
  댓글은 로그인 한 사용자만 달 수 있으며, 댓글 작성시 현재 페이지를 reload 한다.
  ![댓글 페이징](https://user-images.githubusercontent.com/102968499/215334034-c13aba6a-a09c-4392-ab28-e7a255ad33a5.PNG)
  댓글 페이징
  
  **2. 댓글 수정**   
  ![댓글 수정(1)](https://user-images.githubusercontent.com/102968499/215333498-c3b15f4b-73f9-4d3b-b9d7-92d7a9df416f.PNG)
  ![댓글 수정(2)](https://user-images.githubusercontent.com/102968499/215333586-e1ad887c-2e14-4bdb-bb87-c549d6860d9d.PNG)
  다른 사용자는 다른 사람의 댓글을 수정/삭제할 수 없다.   
  ![댓글 수정(3)](https://user-images.githubusercontent.com/102968499/215333669-44047b33-a0c9-4e59-a1c9-333c2a34e735.PNG)
  ![댓글 수정(4)](https://user-images.githubusercontent.com/102968499/215333732-c8e45d80-6aba-40be-9710-d5e8b0f60caf.PNG)
  수정은 댓글 작성자만이 할 수 있다. 수정 완료 후 현재 페이지를 reload 한다.   
  
  **3. 댓글 삭제**   
  ![댓글 삭제(1)](https://user-images.githubusercontent.com/102968499/215333818-19c23075-20fe-4286-bab8-0504839b9786.PNG)
  ![댓글 삭제(2)](https://user-images.githubusercontent.com/102968499/215333822-f6681ba0-66c4-4483-8445-3f60525221cb.PNG)     
  삭제 또한 댓글 작성자만이 할 수 있다. 삭제 후 현재 페이지를 reload 한다.   
           
  </details>
  <br/>   
 
   
## 구조 및 설계   
   
### 1. 패키지 구조
   
<details>
  
<summary>패키지 구조 보기</summary> 

  ![패키지 구조1](https://user-images.githubusercontent.com/102968499/215311670-9cad731a-de4c-438b-96db-7997978432db.PNG)
  
  ![패키지 구조2](https://user-images.githubusercontent.com/102968499/215311678-31f1c887-f69f-4bb8-91d4-9e717037d7d4.PNG)

 </details>   
 <br/>    
   
     
 ### 2. DB 설계

![DB구조](https://user-images.githubusercontent.com/102968499/215308894-664d512d-760c-4336-8c8e-c5a3f961461f.PNG)
![co_member](https://user-images.githubusercontent.com/102968499/215324154-8217c90a-770d-40bb-a451-51fa9476ce4e.PNG)
![co_member_auth](https://user-images.githubusercontent.com/102968499/215324171-3f7be5fc-f0cb-45ff-acd0-4ca0a34f3ab5.PNG)
![co_board](https://user-images.githubusercontent.com/102968499/215324181-63beb90b-141e-41cf-9511-813ee780e559.PNG)
![co_reply](https://user-images.githubusercontent.com/102968499/215324187-27682a59-77a9-4581-83c4-9611fbe309ec.PNG)
   
<br/>

### 3. API 설계

![게시판 관련](https://user-images.githubusercontent.com/102968499/215324113-79426f24-8a52-48d7-a24d-382f9c757b65.PNG)
![회원 관련](https://user-images.githubusercontent.com/102968499/215324125-816543bb-5792-4e7a-b532-57a9aa71b227.PNG)
![댓글 관련](https://user-images.githubusercontent.com/102968499/215324130-1ccc6066-139b-401b-be66-81b32d17e650.PNG)


## 마치며   
### 1. 프로젝트 보완사항   
내용 쓰기
<details>
  <summary>보완사항 보기</summary>
     
- 페이지 처음, 끝으로 이동하는 버튼
- 내 위치에 해당하는 내비게이션 바 색 활성화 하기 
- 댓글 화면 디자인 변경
  
</details>     
   
   <details>
  <summary>추가할 기능 </summary>
     
- 회원가입 기능 추가
- 내 정보 페이지 추가
- 내 정보 수정 기능 추가
- 쿠키나 세션을 이용해 조회수 중복 카운트 방지
- 파일 업로드 기능 추가
  
</details>  
 
