<html>
<head>

% include('header.tpl')

<!-- Google Maps APIを読み込む -->
  <script type="text/javascript"
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDovf0p_K1tRuNQFdDGwVa3MvlDm-H6tPU">
  </script>

  <!-- initialize()関数を定義 -->
  <script type="text/javascript">
    function initialize() {
      // 地図を表示する際のオプションを設定
      var latlng = new google.maps.LatLng({{lat}}, {{lng}});

      var mapOptions = {
        center: latlng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        // マウスホイールによるズーム操作を無効
        scrollwheel: false
      };

      // Mapオブジェクトに地図表示要素情報とオプション情報を渡し、インスタンス生成
      var map = new google.maps.Map(document.getElementById("map_canvas"),
          mapOptions);

      var marker = new google.maps.Marker({
          map: map,
          position: latlng
      });

    }
  </script>
</head>

<body onload="initialize()">
  <div id="cover-image">
    <img src="#">
  </div>
  <img src=/img/{{item_list[0]["facilityImgName"]}}>
  <h1>{{item_list[0]["facilityName"]}}</h1>
  <!-- 地図を表示させる要素。widthとheightを必ず指定する。 -->
  <div id="map_canvas" style="width:50%; height:50%"></div>
  <script type="text/javascript" src="/js/map.js"></script>
  <a href="https://reserva.be/treehouse/reserve?mode=service_staff&search_evt_no=dbeJwzNDA2MQUAAvAA_g" target="_blank"><img src="https://reserva.be/reserva/images/btn_reserve_2.png" alt="RESERVA予約システムから予約する" width="120"></a>
</body>








% include('footer.tpl')
</html>
