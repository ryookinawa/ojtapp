<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

</head>
<body>

<h1>施設一覧</h1>
<!-- <a href='/fac/add'>施設新規登録</a> -->
  <!-- %for item in item_list: -->
  <div class="container">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>施設名</th>
          <th>施設概要</th>
          <th>住所</th>
          <th>料金</th>
          <th>写真ファイル名</th>
          <th>削除ボタン</a>
          <th>編集ボタン</a>
          </th>
        </tr>
      </thead>
      %for item in item_list:
      <tbody>
        <tr>
          <td>{{item["id"]}}</td>
          <td>{{item["facilityName"]}}</td>
          <td>{{item["facilityDesc"]}}</td>
          <td>{{item["facilityAddr"]}}</td>
          <td>{{item["facilityPrice"]}}</td>
          <td>{{item["facilityImgName"]}}</td>
          <td><a href="/fac/del/{{item['id']}}">削除</a></td>
          <!-- ToDo：大樹から貰ったUpdateの方式に変更する -->
          <td><a href="/fac/update/{{item['id']}}">編集</a></td>
        </tr>
      </tbody>
        %end
    </table>
  </div>
</body>
% include('footer.tpl')
</html>
