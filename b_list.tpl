<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

</head>
<body>

<h1>トピック一覧</h1>
  <div class="container">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>名前</th>
          <th>メッセージ(日本語)</th>
          <th>メッセージ(英語)</th>
          <th>IPアドレス</th>
          <th>投稿日付</th>
          <th>施設ID</th>
          <th>削除ボタン</a>
          <th>編集ボタン</a>
          </th>
        </tr>
      </thead>
      %for board in board_list:
      <tbody>
        <tr>
          <td>{{board["id"]}}</td>
          <td>{{board["name"]}}</td>
          <td>{{board["messageJp"]}}</td>
          <td>{{board["messageEn"]}}</td>
          <td>{{board["ip"]}}</td>
          <td>{{board["date"]}}</td>
          <td>{{board["facid"]}}</td>
          <td><a href="/board/del/{{board['id']}}">削除</a></td>
          <!-- ToDo：大樹から貰ったUpdateの方式に変更する -->
          <td><a href="/board/update/{{board['id']}}/{{board['name']}}">編集</a></td>
        </tr>
      </tbody>
        %end
    </table>
  </div>
</body>
% include('footer.tpl')
</html>
