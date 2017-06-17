<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

</head>
<h1>ユーザー一覧</h1>
<!-- <a href='/user/add'>ユーザー新規作成</a> -->
  <!-- %for item in item_list: -->
  <div class="container">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>名前</th>
          <th>苗字</a>
          <th>メールアドレス</a>
          <th>電話番号</a>
          <th>誕生日</a>
          <th>性別</a>
          <th>編集ボタン</a>
          <th>削除ボタン</a>
          </th>
        </tr>
      </thead>
      %for item in item_list:
      <tbody>
        <tr>
          <td>{{item["id"]}}</td>
          <td>{{item["firstName"]}}</td>
          <td>{{item["lastName"]}}</td>
          <td>{{item["mail"]}}</td>
          <td>{{item["tel"]}}</td>
          <td>{{item["birthday"]}}</td>
          <td>{{item["sex"]}}</td>
          <td><a href="/user/del/{{item['id']}}">削除</a></td>
          <td><a href="/user/update/{{item['id']}}/{{item['firstName']}}">編集</a></td>
        </tr>
      </tbody>
        %end
    </table>
  </div>

% include('footer.tpl')
</html>
