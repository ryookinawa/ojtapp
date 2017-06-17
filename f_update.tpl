<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

  <script type="text/javascript">
    $(function() {
      // submit()に関数をバインド
      $('form').submit(function() {
        var name = $('#nameData').val();
        // ダイアログを出していいえを選択したら…
        if (!confirm(name + "で更新します\nよろしいですか？？" )) {

          // 処理を中断
          return false;
        }
      });
    });
  </script>

</head>

<body>

  <h1>{{fac_list[0]["id"]}}番目のアイテム編集</h1>


  <form action='' method='POST'>
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th>施設名</th>
            <td><input type='text' id='nameData' name='facility_name' value={{fac_list[0]["facilityName"]}} /></td>
          </tr>
          <tr>
            <th>施設概要</th>
            <td><input type='text' id='descData' name='facility_desc' value={{fac_list[0]["facilityDesc"]}} /></td>
          </tr>
          <tr>
            <th>住所</th>
            <td><input type='text' id='addrData' name='facility_addr' value={{fac_list[0]["facilityAddr"]}} /></td>
          </tr>
          <tr>
            <th>料金</th>
            <td><input type='text' id='priceData' name='facility_price' value={{fac_list[0]["facilityPrice"]}} /></td>
          </tr>
          <tr>
            <th>写真</th>
            <td><input type='text' id='imgnameData' name='facility_image_name' value={{fac_list[0]["facilityImgName"]}} /><td>
          </tr>
          <tr>
        </thead>
      </table>
      <input type='submit' value='編集' />
    </div>
  </form>

  <!-- <hr>
  <br> <a href='/add'>新規作成</a>   <br> <a href='/list'>一覧表示</a> -->

</body>
% include('footer.tpl')
</html>
