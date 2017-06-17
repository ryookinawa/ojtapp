<HTML>

<HEAD>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/js/vegas.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vegas.min.css">
  <link rel="stylesheet" type="text/css" href="/css/teaser.css">

  <SCRIPT language="JavaScript">
    <!--
    // 一定時間経過後に指定ページにジャンプする
    // mnt = 20; // 何秒後に移動するか？
    // url = "http://localhost:9999/top"; // 移動するアドレス
    // function jumpPage() {
    //   location.href = url;
    // }
    // setTimeout("jumpPage()", mnt * 1000)
    // //-->
  </SCRIPT>
</HEAD>

<BODY bgcolor="#ffffff">

  <SCRIPT language="JavaScript">
    $("#example, body").vegas({
    timer: false,
    loop: false,
    slides: [
        { src: "/img/slide1.jpg" },
        { src: "/img/slide2.jpg" },
        { src: "/img/slide3.jpg" },
        { src: "/img/slide4.jpg" }
    ],
    walk: function (index, slideSettings) {
        console.log("Slide index " + index + " image " + slideSettings.src);
        if (index == 3){
          url = "/top"; // 移動するアドレス
          location.href = url;
        }
    }
});
  </SCRIPT>
  <!-- <div class="vegas-wrapper" style="overflow: visible; padding: 0px;"> -->
  <div class="vegas-wrapper" style="padding: 0px;">
  <div class="home-nav">
  		<div class="home-nav-inner clearfix">
      <h1 style="text-transform: uppercase; letter-spacing: 2px; font-weight: 900; font-size: 50px;"><span style="color: #d9e0e2;">The</span> Tree House</h1>
  		<!-- <ul class="clearfix">
  			<li><a href="http://kourijima.info/about/">TreeHouse</a></li>
  			<li><a href="http://kourijima.info/map/">YYYYY</a></li>
  			<li><a href="http://kourijima.info/beach/">ZZZZZZZ</a></li>
  			<li><a href="http://kourijima.info/blog/">MMMMMM</a></li>
  			<li><a href="http://kourijima.info/access/">CCCCCCCC</a></li>
  			<li><a href="http://kourijima.info/information/">AAAAAA</a></li>
  			<li><a href="//ck.jp.ap.valuecommerce.com/servlet/referral?sid=3347481&amp;pid=884685260&amp;vc_url=http%3A%2F%2Fwww.jalan.net%2Fuw%2Fuwp2011%2Fuww2011init.do%3Fkeyword%3D%258C%25C3%2589F%2597%2598%2593%2587%26distCd%3D06%26rootCd%3D7701%26screenId%3DFWPCTOP%26image1.x%3D0%26image1.y%3D0" target="_blank" rel="nofollow"><img src="//ad.jp.ap.valuecommerce.com/servlet/gifbanner?sid=3347481&amp;pid=884685260" height="1" width="0" border="0">XXXXX</a></li>
  		</ul> -->
  		</div>
  </div>
</div>


</BODY>

</HTML>
