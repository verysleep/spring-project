<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 함수진 -->
<!-- 작성일 : 2024-06-28 -->
<!-- 최종수정일 : 2024-07-19 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 개발자가 작성한 title을 가져다가 사용 -->
<title>BGS<decorator:title /></title> 
<!-- 아이콘 라이브러리(부트스트랩) -->
<style type="text/css">
/* 구글 폰트 */
@import
   url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap')
   ;

@import
   url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Jua&display=swap')
   ;

@font-face {
   font-family: 'goorm-sans-code';
   src:
      url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-code.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

.dm-sans-navbar-nav {
   font-family: "DM Sans", sans-serif;
   font-optical-sizing: auto;
   font-weight: <weight>;
   font-style: normal;
}

.navbar-custom {
   border-bottom: 1px solid #e6e6e6; /* 하단에 솔리드 선 추가 */
}

.navbar {
   margin-bottom: 0;
   border-radius: 0;
}

article {
   min-height: 975px;
   margin-top: 60px;
}

.nav-item {
   margin: 0 10px;
   font-family: 'goorm-sans-code';
}

.container {
   text-align: left;
   padding: 30px 0;
}

.bg-custom {
   background-color: #fff;
}

.nav-link {
   color: #444 !important;
   font-weight: bold;
}

.dropdown-menu-right {
   right: 0;
   left: auto;
}

.dropdown {
   margin-left: 50px;
}

#scrollTopBtn {
   display: none;
   position: fixed;
   bottom: 20px;
   right: 20px;
   z-index: 99;
   background-color: #007bff;
   color: white;
   border: none;
   border-radius: 50%;
   width: 50px;
   height: 50px;
   cursor: pointer;
}

.jua-regular {
   font-family: "Jua", sans-serif;
   font-weight: 400;
   font-style: normal;
}

.text-shadow {
   color: #66c2ff; /* 텍스트 색상 */
   text-shadow: -1px -1px 0 #e6f5ff, 1px -1px 0 #e6f5ff, -2px 2px 0 #e6f5ff,
      1px 1px 0 #e6f5ff; /* 윤곽선 색상 및 두께 */
}

.btn:focus {
   outline: none;
   box-shadow: none;
}
</style>
<script type="text/javascript">
   $(function() {
      // 취소 버튼 이벤트
      $(".cancelBtn").click(function() {
         history.back();
      });
   });
</script>
<script>
   // TOP 버튼 이벤트
   document.addEventListener('DOMContentLoaded', function() {
      var scrollTopBtn = document.getElementById("scrollTopBtn");

      window.addEventListener('scroll', function() {
         var scrollPosition = window.scrollY
               || document.documentElement.scrollTop;

         if (scrollPosition > 20) {
            scrollTopBtn.style.display = "block";
         } else {
            scrollTopBtn.style.display = "none";
         }
      });
      // TOP 버튼 이벤트 스크롤 상세 설정
      scrollTopBtn.addEventListener("click", function() {
         window.scrollTo({
            top : 0,
            behavior : "smooth"
         });
      });
   });
</script>

<decorator:head />

</head>
<body>
   <header>
      <!-- TOP 버튼 -->
      <button id="scrollTopBtn" title="Go to top">Top</button>
      <!-- 네비게이션 메뉴바 (로고 이미지)-->
      <nav class="navbar navbar-expand-lg bg-custom fixed-top navbar-custom">
         <!--          <a -->
         <%--             class="navbar-brand jua-regular ${(empty module || module == '/main')?'active':'' }" --%>
         <!--             href="/main/main.do" -->
         <!--             style="margin-left: 20px; color: #cceeff; font-size: 30px; font-style: italic;"> -->
         <!--             <span class="text-shadow"><b>빵꼭쓩</b>&nbsp;<i -->
         <!--                class="fa fa-plane" style="color: #66c2ff"></i></span> -->
         <!--          </a> -->
         <a class="navbar-brand" href="#"> <img src="/uploads/logo2.PNG"
            alt="Logo" style="width: 160px; height: 45px; margin-left: 20px;">
         </a>
         <!-- 모바일 화면시 보이는 햄버거 버튼 -->
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-align-justify" style="color: white"></span>
         </button>
         <!-- 네비게이션 메뉴바 -->
         <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
               <li class="nav-item ${( module == '/Board')?'active':'' }"><a
                  class="nav-link" href="/board/list.do"><i class="fa fa-pencil"
                     style="width: 20px; height: 20px;"></i>여행일기</a></li>
               <li class="nav-item ${( module == '/album')?'active':'' }"><a
                  class="nav-link" href="/album/list.do"><img
                     src="/uploads/free-icon-double-bed.png"
                     style="width: 20px; height: 20px;"> 호텔</a></li>
               <li class="nav-item ${( module == '/music')?'active':'' }"><a
                  class="nav-link" href="/music/newList.do"><i
                     class="fa fa-plane" style="width: 24px; height: 24px;"></i>항공권</a></li>
               <li class="nav-item ${( module == '/music')?'active':'' }"><a
                  class="nav-link" href="/music/topList.do"><img
                     src="/uploads/free-icon-ferris-wheel.png"
                     style="width: 20px; height: 20px;"> 즐길거리</a></li>
               <c:if test="${!empty login && login.gradeNo == 9 }">
                  <li class="nav-item ${( module == '/member')?'active':'' }"><a
                     class="nav-link" href="/member/list.do">MEMBER</a></li>
                  <li class="nav-item ${( module == '/pay')?'active':'' }"><a
                     class="nav-link" href="/pay/adminList.do">PAY</a></li>
               </c:if>
            </ul>

            <!-- 회원 관리 일반 버튼 형식 메뉴 -->
            <div class="btn-group nav-item" style="margin-right: 20px;">
               <button type="button" class="btn btn-outline-dark border-right">
                  로그인</button>
               <button type="button" class="btn btn-outline-dark">회원가입</button>
            </div>
         </div>
      </nav>
   </header>

   <article>
      <decorator:body />
   </article>
   <footer class="container-fluid text-center py-3"
      >
      <hr class="my-2" style="border-color: #ddd;">
      <p class="mb-0" style="color: #444;">&copy; 2024 BANGKOK. All
         rights reserved.</p>
   </footer>
   <!-- 처리 결과 모달창 -->
   <c:if test="${ !empty msg }">
      <div class="modal" id="msgModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title">처리 결과</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">${msg }</div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      <!-- 모달창 이벤트 -->
      <script type="text/javascript">
         $(function() {
            $("#msgModal").modal("show");
         });
      </script>

   </c:if>
</body>
</html>

