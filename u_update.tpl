<html>
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

  <h1>{{id}}番目のアイテム編集</h1>


  <form action='' method='POST'>
    <!-- <input type='text' name='item_name' value={{name}} /> -->
    <input type='text' id='nameData' name='user_firstName' value={{name}} />
    <input type='submit' value='編集' />
  </form>

  <hr>
  <br> <a href='/user/add'>新規作成</a>   <br> <a href='/user/list'>一覧表示</a>

</body>

</html>
