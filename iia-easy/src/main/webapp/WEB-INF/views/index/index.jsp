<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${contact.name}</title>
	<!--// Stylesheets //-->
	<link href="${ctx}/resources/frame/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/frame/css/red.css" title="styles1" media="screen" />
	<link rel="alternate stylesheet" type="text/css" href="${ctx}/resources/frame/css/blue.css" title="styles2" media="screen" />
	<link rel="alternate stylesheet" type="text/css" href="${ctx}/resources/frame/css/gray.css" title="styles3" media="screen" />
	<link rel="alternate stylesheet" type="text/css" href="${ctx}/resources/frame/css/orange.css" title="styles4" media="screen" />
	<link rel="alternate stylesheet" type="text/css" href="${ctx}/resources/frame/css/green.css" title="styles5" media="screen" />
	<link rel="alternate stylesheet" type="text/css" href="${ctx}/resources/frame/css/orange-red.css" title="styles6" media="screen" />
	<!--// Javascripts //-->
	
	<script type="text/javascript" src="${ctx}/resources/frame/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/styleswitch.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/animatedcollapse.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/jquery.nivo.slider.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/jquery.infinite-carousel.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/scrolltopcontrol.js"></script>
	<script type="text/javascript" src="${ctx}/resources/frame/js/functions.js"></script>
</head>

<body>
		<%@include file="../common/header.jsp" %>
		
		<!-- Banner Start -->
		<div id="banner">
			<div class="slider-wrapper theme-default">
				<div id="slider" class="nivoSlider">
					<c:forEach items="${scrollPicList}" var="vo" varStatus="vst">
						<a href="javascript:void(0)"><img src="${resUrl}${vo.url}" title="#banner${vst.index + 1}" alt="" /></a> 
					</c:forEach>
				</div>
				
				<!-- Banner Caption Start -->
				<c:forEach items="${scrollPicList}" var="vo" varStatus="vst">
					<div id="banner${vst.index + 1}" class="nivo-html-caption">
						<div class="ban-capt-desc">
							<div class="ban-capt-mid">
								<div class="ban-capt-in">
									<h3 class="white">${vo.content}</h3>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Banner Caption End -->
				
			</div>
		</div>
		<!-- Banner End -->
		
		
		<!-- Content Section Start -->
		<div id="contentsec">
			<div class="inner">
				<!-- Fullwidth Box Start -->
				<div class="fullwidth box left">
					<div class="widgets-area-conts">
						<!-- Widget PlaceHolder Start -->
						<div class="widget-placeholder">
							<!-- Text Widget Start -->
							<div class="widget textwidget">
								<h3 class="widget-head">Watch the Latest Messages</h3>
								<h4 class="colr">Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Aenean commodo dolor at sapien luctus non
									venenatis dui.</h4>
								<p>Your membership means more than simply signing a piece of
									paper. Becoming a member of Stonebriar expresses your
									commitment to this.</p>
								<blockquote>
									<p class="italic">Your membership means more than simply
										signing a piece of paper. Becoming a member Your membership
										means more than simply.</p>
								</blockquote>
								<a href="#" class="buttonone">Watch Video</a>
								<div class="clear"></div>
							</div>
							<!-- Text Widget End -->
						</div>
						<!-- Widget PlaceHolder End -->
						<!-- Widget PlaceHolder Start -->
						<div class="widget-placeholder">
							<!-- Calendar Widget Start -->
							<div class="widget wp-calendar">
								<h3 class="widget-head">Event Calender</h3>
								<div class="calendar">
									<ul class="months backcolr">
										<li><a href="#" class="calendar-prev">&nbsp;</a></li>
										<li><h4 class="white">January 2012</h4></li>
										<li><a href="#" class="calendar-next">&nbsp;</a></li>
									</ul>
									<ul class="days">
										<li>Mon</li>
										<li>Tue</li>
										<li>Wed</li>
										<li>Thu</li>
										<li>Fri</li>
										<li>Sat</li>
										<li>Sun</li>
									</ul>
									<ul class="dates">
										<li class="disabled"><a href="#" class="ev-date">30</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
										<li><a href="#">7</a></li>
										<li><a href="#">8</a></li>
										<li><a href="#" class="ev-date">9</a></li>
										<li><a href="#">10</a></li>
										<li><a href="#">11</a></li>
										<li><a href="#" class="ev-date">12</a></li>
										<li><a href="#" class="ev-date">13</a></li>
										<li><a href="#" class="ev-date">14</a></li>
										<li><a href="#">15</a></li>
										<li><a href="#">16</a></li>
										<li><a href="#">17</a></li>
										<li><a href="#">18</a></li>
										<li><a href="#">19</a></li>
										<li><a href="#" class="ev-date">20</a></li>
										<li><a href="#">21</a></li>
										<li><a href="#">22</a></li>
										<li><a href="#" class="ev-date">23</a></li>
										<li><a href="#">24</a></li>
										<li><a href="#" class="ev-date">25</a></li>
										<li><a href="#">26</a></li>
										<li><a href="#">27</a></li>
										<li><a href="#">28</a></li>
										<li><a href="#">29</a></li>
										<li><a href="#">30</a></li>
										<li><a href="#">31</a></li>
										<li class="disabled"><a href="#">1</a></li>
										<li class="disabled"><a href="#">2</a></li>
										<li class="disabled"><a href="#">3</a></li>
									</ul>
								</div>
							</div>
							<!-- Calendar Widget End -->
						</div>
						<!-- Widget PlaceHolder End -->
						<!-- Widget PlaceHolder Start -->
						<div class="widget-placeholder">
							<!-- Donation Widget Start -->
							<div class="widget donation">
								<h3 class="widget-head">Help Us Reach Our Goal</h3>
								<div class="donation-area">
									<div class="donation-detail">
										<div class="raised">
											<h1 class="colr">$14,856</h1>
											<p>Rased so far</p>
										</div>
										<div class="goal">
											<h1 class="colr">$30,000</h1>
											<p>Our Goal</p>
										</div>
									</div>
									<div class="donate-bar-sec">
										<div class="dont-bar">
											<span class="filledbar backcolr" style="width: 40%">&nbsp;</span>
										</div>
										<span class="zero-figre">$0</span> <span class="end-figre">$30,000</span>
									</div>
								</div>
								<a href="#" class="buttonone">More About Cuase</a>
							</div>
							<!-- Calendar Widget End -->
						</div>
						<!-- Widget PlaceHolder End -->
					</div>
				</div>
				<!-- Fullwidth Box End -->
				<!-- Two Third Box Start -->
				<div class="twothird box padbox left">
					<!-- Half Box Start -->
					<div class="halfbox left">
						<h3 class="heading colr">Welcome to Identity Church</h3>
						<!-- Home Page Post Start -->
						<div class="home-post">
							<a href="#" class="thumb"><img src="images/img1.jpg" alt="" /></a>
							<h4>
								<a href="#">Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Aenean commodo dolor at sapien luctus non
									venenatis dui lacinia. Phasellus viverra, orci ut lacinia</a>
							</h4>
							<p>Your membership means more than simply signing a piece of
								paper. Becoming a member of Stonebriar expresses your commitment
								to this "spiritual family," A family that worships together,
								grows in faith together, and serves one another.</p>
							<a href="#" class="readmore">Read more</a>
						</div>
						<!-- Home Page Post End -->
						<h3 class="heading colr">How to Becoming a Member</h3>
						<!-- Home Page Post Start -->
						<div class="home-post">
							<h4>
								<a href="#">A family that worships together, grows in faith
									together, and serves one another.</a>
							</h4>
							<p>Your membership means more than simply signing a piece of
								paper. Becoming a member of Stonebriar expresses your commitment
								to this "spiritual family," A family that worships together.Your
								membership means more than simply signing a piece of paper.
								Becoming a member of Stonebriar.</p>
							<p>A family that worships together.Your membership means more
								than simply signing a piece of paper. Becoming a member of
								Stonebriar.</p>
							<a href="#" class="readmore">Read more</a>
						</div>
						<!-- Home Page Post End -->
					</div>
					<!-- Half Box End -->
					<!-- Half Box Start -->
					<div class="halfbox right">
						<h3 class="heading colr">Ministries and programs</h3>
						<!-- Home Page Post Start -->
						<div class="home-post">
							<a href="#" class="thumb"><img src="images/img2.jpg" alt="" /></a>
							<h4>
								<a href="#">Worship and prayer</a>
							</h4>
							<p>A federal judge in Ohio ruled Monday that former Rep.
								Steve Driehaus' defamation suit. In a case that</p>
							<a href="#" class="readmore">Read more</a>
						</div>
						<!-- Home Page Post End -->
						<!-- Home Page Post Start -->
						<div class="home-post">
							<a href="#" class="thumb"><img src="images/img3.jpg" alt="" /></a>
							<h4>
								<a href="#">Weekly Service</a>
							</h4>
							<p>A federal judge in Ohio ruled Monday that former Rep.
								Steve Driehaus' defamation suit. In a case that</p>
							<a href="#" class="readmore">Read more</a>
						</div>
						<!-- Home Page Post End -->
						<!-- Home Page Post Start -->
						<div class="home-post">
							<a href="#" class="thumb"><img src="images/img4.jpg" alt="" /></a>
							<h4>
								<a href="#">Give up for Childrens</a>
							</h4>
							<p>A federal judge in Ohio ruled Monday that former Rep.
								Steve Driehaus' defamation suit. In a case that</p>
							<a href="#" class="readmore">Read more</a>
						</div>
						<!-- Home Page Post End -->
					</div>
					<!-- Half Box End -->
				</div>
				<!-- Two Third Box End -->
				<!-- One Third Box Start -->
				<div class="onethird right">
					<!-- One Third Box Start -->
					<div class="onethird box left">
						<!-- Upcoming Widget Start -->
						<div class="widget upcoming-events">
							<h3 class="widget-head-border colr">Upcomming Events</h3>
							<ul>
								<li>
									<div class="date">
										<span>01</span> <span>JUL</span>
									</div>
									<div class="desc">
										<a href="#" class="title txthover">Aenean commodo dolor at
											sapien luc tus non venenatis</a>
										<p class="time">12:00 PM - 1:00 PM</p>
										<p class="location">Location: Lorum ipsum Church</p>
									</div>
								</li>
								<li>
									<div class="date">
										<span>05</span> <span>JUL</span>
									</div>
									<div class="desc">
										<a href="#" class="title txthover">Aenean commodo dolor at
											sapien luc tus non venenatis</a>
										<p class="time">12:00 PM - 1:00 PM</p>
										<p class="location">Location: Lorum ipsum Church</p>
									</div>
								</li>
								<li>
									<div class="date">
										<span>08</span> <span>JUL</span>
									</div>
									<div class="desc">
										<a href="#" class="title txthover">Aenean commodo dolor at
											sapien luc tus non venenatis</a>
										<p class="time">12:00 PM - 1:00 PM</p>
										<p class="location">Location: Lorum ipsum Church</p>
									</div>
								</li>
							</ul>
						</div>
						<!-- Upcoming Widget End -->
					</div>
					<!-- One Third Box End -->
					<!-- One Third Box Start -->
					<div class="onethird box left">
						<!-- Facebook Widget Start -->
						<div class="widget facebook-widget">
							<a href="#"><img src="images/facebook.jpg" alt="" /></a>
						</div>
						<!-- Facebook Widget Start -->
					</div>
					<!-- One Third Box End -->
				</div>
				<!-- One Third Box End -->
				
				
				<!-- Footer Scroller Start -->
				<div class="fullwidth left scroll-sec">
					<a id="logoPrevious" style="margin:-8px 17px 0px 0px;height: 30px;">Previous</a>
					<div id="logoscroll" class="scroller">
						<ul>
							<c:forEach items="${linkList}" var="vo">
								<li><a href="${vo.url}">${vo.name}</a></li>
							</c:forEach>
						</ul>
					</div>
					<a id="logoNext" style="margin:-8px 17px 0px 0px;height: 30px;">Next</a>
				</div>
				<!-- Footer Scroller End -->
			</div>
		</div>
		<!-- Content Section End -->
	
		<%@include file="../common/footer.jsp" %>
	
	</div>
	<!-- Wrapper End -->

</body>
</html>