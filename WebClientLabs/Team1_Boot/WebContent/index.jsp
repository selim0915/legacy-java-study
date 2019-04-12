<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Team 1 until</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css'>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link rel="stylesheet" href="css/style.css">
	<link href="css/common.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700" rel="stylesheet">
	
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	
	<style>
	/* scroll */
	#top {
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
</head>
<body>
	<!-- Header -->
	<jsp:include page="/module/top.jsp"></jsp:include>

	<!-- Menu -->
	<jsp:include page="/module/menu.jsp"></jsp:include>

	<!-- Middle -->
	<section class="rw-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<h2 class="rw-sentence">
						<span>Who are we?<br /> We
						</span>
						<div class="rw-words rw-words-1">
							<span>are full-stack developer.</span> <span>are family.</span>
							<span>have dreams.</span> <span>must succeed.</span> <span>want
								everyone to succeed.</span>
						</div>
					</h2>
				</div>
			</div>
		</div>
	</section>
	
	<a href="javascript:" id="top"><i class="fas fa-arrow-circle-up"></i></a>
	<div class="scroll">
		<!-- Card List -->
		<section id="zzang">
			<div class="container">
				<div class="row">
					<div class="col-sm top-in">
						<div class="overlay">
							<a href="jeonproduct/Gomtokki.html"><button type="button"
									class="btn btn-light ff">보러가기</button></a>
						</div>
						<img src="img/4.jpg" width="300" height="300"
							class="rounded-circle">

						<div class="media-body">
							<div class="line-in"></div>
							<h5 class="mt-0">정일찬</h5>
							<div class="line-in"></div>
							<p>팀 최고 실력자이시며 없어서는 안될 존재 다만, CSS에 약한 모습을 보이심</p>
						</div>
					</div>

					<div class="col-sm top-in">
						<div class="overlay">
							<a href="kimproduct/zzangmain.html">
								<button type="button" class="btn btn-light ff">보러가기</button>
							</a>
						</div>
						<img src="img/6.jpg" width="300" height="300"
							class="rounded-circle">

						<div class="media-body">
							<div class="line-in"></div>
							<h5 class="mt-0">김동민</h5>
							<div class="line-in"></div>
							<p>실력이 있어보이지만 있어보이지 않는 그런 존재이지만 팀을 이끌고 있는 1조의 캡틴</p>
						</div>
					</div>
					<div class="col-sm top-in">
						<div class="overlay">
							<a href="leeproduct/index_intro.html"><button type="button"
									class="btn btn-light ff">보러가기</button></a>
						</div>
						<img src="img/5.jpg" width="300" height="300"
							class="rounded-circle">

						<div class="media-body">
							<div class="line-in"></div>
							<h5 class="mt-0">이교선</h5>
							<div class="line-in"></div>
							<p>HTML/CSS의 숨겨진 고수. 커피를 마시면 능력이 올라가는 기술이 있으심 다만, JAVA에 약한모습이
								보이심</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-sm top-in">
					<div class="overlay">
						<a href="sinproduct/SJH.html"><button type="button"
								class="btn btn-light ff">보러가기</button></a>
					</div>
					<img src="img/3.jpg" width="300" height="300"
						class="rounded-circle">

					<div class="media-body">
						<div class="line-in"></div>
						<h5 class="mt-0">신지혁</h5>
						<div class="line-in"></div>
						<p>신지혁... 과연 그는 누구인가?? 나도 그가 궁금하다..</p>
					</div>
				</div>

				<div class="col-sm top-in">
					<div class="overlay">
						<a href="http://192.168.0.3/" target="_blank"><button type="button" class="btn btn-light ff">보러가기</button></a>
					</div>
					<img src="img/gang.jpg" width="300" height="300"
						class="rounded-circle">

					<div class="media-body">

						<div class="line-in"></div>
						<h5 class="mt-0">정신적 지주</h5>
						<div class="line-in"></div>
						<p>우리팀의 정신적 지주... 우리의 숨겨진 실력을 끄집어 낼 수 있는 유일한 존재 다만, 아직 우리가 준비가
							안됨</p>
					</div>
				</div>
				<div class="col-sm top-in">
					<div class="overlay">
						<a href="wooproduct/serimHome.html"><button type="button"
								class="btn btn-light ff">보러가기</button></a>
					</div>
					<img src="img/2.jpg" width="300" height="300"
						class="rounded-circle">

					<div class="media-body">

						<div class="line-in"></div>
						<h5 class="mt-0">우세림</h5>
						<div class="line-in"></div>
						<p>우세림 장난기가 많고 웃음이 많은 우리팀의 스마일 전도사... 그리고.........</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/module/bottom.jsp"></jsp:include>
	
</body>
	<script src="js/index.js"></script>
	<script src="js/topscroll.js"></script>
</html>