<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세림이방</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css'>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link href="css/common.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700" rel="stylesheet">
	<!-- 세림 추가 -->
	<link href="css/sr.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Yeon+Sung&amp;subset=korean" rel="stylesheet">
	<link href="fotorama/fotorama.css" rel="stylesheet">
	<script src="fotorama/fotorama.js"></script>

	<script type="text/javascript">
		$(function () {
		    var $fotoramaDiv = $('#fotorama').fotorama();
		    var fotorama = $fotoramaDiv.data('fotorama');
		  });
	</script>
	
	<script type="text/javascript">
	(function() {
		  let mainNavLinks = document.querySelectorAll("#sidebar-nav ul a");
		  let mainSections = document.querySelectorAll("main > section");
	
		  function init() {
		    doSmoothScrolling();
		    doActiveNav();
		    doMobileSidebar();
		  }
	
		  function doSmoothScrolling() {
		    mainNavLinks.forEach(link => {
		      link.addEventListener("click", event => {
		        event.preventDefault();
		        let target = document.querySelector(event.target.hash);
		        target.scrollIntoView({
		          behavior: "smooth",
		          block: "start"
		        });
		      });
		    });
		  }
	
		  function doActiveNav() {
		    let lastId;
		    let cur = [];
		    
		    // This should probably be throttled.
		    // Especially because it triggers during smooth scrolling.
		    
		    window.addEventListener("scroll", event => {
		      let fromTop = window.scrollY;
	
		      mainNavLinks.forEach(link => {
		        console.log(link);
		        let header = document.querySelector(link.hash);
		        let section = header.parentElement;
	
		        if (
		          section.offsetTop <= fromTop &&
		          section.offsetTop + section.offsetHeight > fromTop
		        ) {
		          link.classList.add("current");
		        } else {
		          link.classList.remove("current");
		        }
		        
		      });
		    });
		  }
		  
		  function doMobileSidebar() {
		    let hamburgerButton = document.querySelector("#hamburger");
		    // let sidebarNav = document.querySelector("#sidebar-nav");
		    hamburgerButton.addEventListener("click", event => {
		      event.preventDefault;
		      if (document.body.classList.contains("sidebar-is-open")) {
		        // document.body.style.removeProperty("width");
		        document.body.classList.remove("sidebar-is-open");
		      } else {
		        // document.body.style.width = window.outerWidth + "px";
		        document.body.classList.add("sidebar-is-open");
		      }
		    })
		  }
	
		  init();
		})();
	</script>
	
	<script>
		var ck;
		function color1(){
			document.getElementById("sr_color_h").style.background="#4172bc"; //인디블루
			document.getElementById("sr_color_h").style.color="black"; 
		}
		function color2(){
			document.getElementById("sr_color_h").style.background="#13442b"; //진초록
			document.getElementById("sr_color_h").style.color="white"; //진초록
		}
	</script>
	
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
	
	<style>
		#top {
			z-index: 2;
			position: fixed;
			bottom: 20px;
			right: 20px;
			background: rgb(0, 0, 0);
			background: rgba(0, 0, 0, 0.7);
			width: 50px;
			height: 50px;
			display: block;
			text-decoration: none;
			-webkit-border-radius: 35px;
			-moz-border-radius: 35px;
			border-radius: 35px;
			display: none;
			-webkit-transition: all 0.3s linear;
			-moz-transition: all 0.3s ease;
			-ms-transition: all 0.3s ease;
			-o-transition: all 0.3s ease;
			transition: all 0.3s ease;
		}
		
		#top i {
			color: #fff;
			margin: 0;
			position: relative;
			left: 12px;
			top: 12px;
			font-size: 25px;
			-webkit-transition: all 0.3s ease;
			-moz-transition: all 0.3s ease;
			-ms-transition: all 0.3s ease;
			-o-transition: all 0.3s ease;
			transition: all 0.3s ease;
		}
		
		#top:hover {
			background: rgba(0, 0, 0, 0.9);
		}
		
		#top:hover i {
			color: #fff;
			top: 5px;
		}
	</style>
</head>

<body>
	<!-- Header -->
	<jsp:include page="/module/top.jsp"></jsp:include>

	<!-- Menu -->
	<jsp:include page="/module/menu.jsp"></jsp:include>

	<!-- contents -->
	<div class="sr_contents">
		<div class="sr_main">
			<div>
				<img src="img/smlie.png" alt="웃는사진" class="sr_m_img1"> '우세하다
				우세림' 페이지 방문을 환영합니다. <img src="img/smlie.png" alt="웃는사진"
					class="sr_m_img2">
			</div>
		</div>
 
 		<div class="row">
 			<div class="col-3 sr_colsize">
				<nav id="sidebar-nav" class="sidebar-nav">
					<h4>Meun</h4>
					<ul>
						<li><a href="#main">좋아하는 프로필</a></li>
						<li><a href="#song">좋아하는 노래</a></li>
						<li><a href="#color">좋아하는 색갈</a></li>
						<li><a href="#food">좋아하는 음식</a></li>
						<li><a href="#price">좋아하는 장소</a></li>
					</ul>
				</nav>
			</div>
		
			<div class="col-9">
				<section>
					<div class="sr_main_h">
						<h4 id="main">좋아하는 프로필</h4>
						우세림페이지에 방문하신 것을 환영합니다!<br><br>
						
						<img src="img/me.jpg" alt="프로필사진">
						<div class="sr_main_text">
							<span><b>name</b>&emsp;&emsp; 우세림 </span><br>
							<span><b>birth</b>&nbsp;&emsp;&emsp; 1996.09.15 </span><br> 
							<span><b>e-mail</b>&nbsp;&nbsp;&emsp;<a href="maito:rhak12@naver.com"> rhak12@naver.com</a> </span><br>
							<span><b>git</b>&nbsp;&emsp;&emsp;&emsp; <a href="http://github.com/selim0915" target="_blank">https://github.com/selim0915</a></span><br> 
							<span><b>hobby</b>&emsp;&emsp;유튜브, 기타, 보드게임</span> <br> 
							<span><b>motto</b>&emsp;&emsp;다같이 행복하게 살자 </span><br>
							<span><b>SNS</b>&nbsp;&nbsp;&emsp;&emsp; 
								<i class="fab fa-facebook-square"></i>
								<i class="fab fa-instagram"></i>
								<i class="fab fa-kickstarter"></i>
								<i class="fab fa-youtube"></i>
							</span>
							<div class="sr_main_text2">
								<a href="http://192.168.0.25:8090/team1_bs/assets/index-slideshow.html">[1조 템플릿 사이트] 구경가기</a> <br>
								<a href="http://192.168.0.25:8090/WebClient/Ex24_home.html">[1조 회원가입 사이트] 구경가기</a> 
							</div>
						</div>
					</div>
				</section>
			    
			    <section>
			    	<div class="sr_song_h">
						<h4 id="song">좋아하는 노래</h4>
						<span style="float:left;">어깨가 저절로 움직이게 만드는 노래 Best3</span><br><br>
						
						<div class="row">
							<div class="col-4">
								<object type="text/html" width="100%" height="250px"
									data="//www.youtube.com/embed/ypit0NcNV-8?autoplay=1">
								</object>
								<span class="sr_song_text">
									박봄-Don't Cry
									<br>
									<a href="#" onclick="window.open('https://music.naver.com/lyric/index.nhn?trackId=2461064', '_blank', 'width=200px, height=600px');">가사보기</a>
								</span>
							</div>
							
							<div class="col-4">
								<object type="text/html" width="100%" height="250px"
									data="//www.youtube.com/embed/l5ABX0Ho-wk?autoplay=1">
								</object>
								<span class="sr_song_text">
									버즈-나에게로 떠나는 여행
									<br>
									<a href="#" onclick="window.open('https://music.naver.com/lyric/index.nhn?trackId=467220', '_blank', 'width=200px, height=600px');">가사보기</a>
								</span>
							</div>
							<div class="col-4">
								<object type="text/html" width="100%" height="250px"
									data="//www.youtube.com/embed/6vR6tyF4vCw?autoplay=1">
								</object>
								<span class="sr_song_text">
									이정-고백
									<br>
									<a href="#" onclick="window.open('https://music.naver.com/lyric/index.nhn?trackId=14825', '_blank', 'width=200px, height=600px');">가사보기</a>
								</span>
							</div>
						</div>
					</div>
			    </section>
			    
			    <section>
			    	<div class="sr_color_h" id="sr_color_h">
						<h4 id="color">좋아하는 색갈</h4>
						아래 버튼을 눌러주세요.<br><br>
						<button onclick="color1()">인디블루</button>
						<button onclick="color2()">진초록</button>
					</div>
			    </section>
			    
			    <section>
			    	<div class="sr_food_h">
						<h4 id="food">좋아하는 음식</h4>
						Favorite Food<br><br>
						<div class="fotorama" data-width="100%" data-height="185" data-allowfullscreen="true" data-nav="thumbs">
							<img src="img/김치찜.jpg"> 
							<img src="img/굴.jpg"> 
							<img src="img/백순대.PNG"> 
							<img src="img/버섯샤브.jpg"> 
							<img src="img/생선가스2.PNG"> 
							<img src="img/소세지2.PNG"> 
							<img src="img/카레우동2.PNG">
							<img src="img/냉국.jpg"> 
							<img src="img/떡볶이.jpg"> 
							<img src="img/모밀.jpg"> 
							<img src="img/전.jpg">
						</div>
					</div>
			    </section>
			    
				<section>
					<div class="sr_price_h">
						<h4 id="price">좋아하는 장소</h4>
						따뜻한 시나몬애플티<br><br>
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.339640959041!2d126.92363341504432!3d37.4999068356994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9fa6e01492cf%3A0xc18d298df1234412!2z7Lm07Y6Y7Y2867iU66as7L2UIOuzuOygkA!5e0!3m2!1sko!2skr!4v1554625924955!5m2!1sko!2skr" class="sr_map">
						</iframe>
					</div>
			    </section>
		    </div>
		    
	    </div>
	</div>
		</div>
	<script src="js/topscroll.js"></script>

	<!-- footer -->
	<jsp:include page="/module/bottom.jsp"></jsp:include>

</body>
</html>