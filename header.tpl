<html>
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap-dropdown.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/js/js.cookie.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/header.css" media="all">
  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <title>Team 4seasons</title>

  <!-- initialize()関数を定義 -->
  <script type="text/javascript">
   var cookie = Cookies.get('account');
   console.log("javascript from account :" + cookie);
   if (cookie != null){
     $(function() {
        $('.login').hide();
        $('.logout').show();
      });
   }
  </script>
  <script type="text/javascript">
    // <![CDATA[
    $(function () {
        $('.dropdown-toggle').dropdown();
    });
    // ]]>
  </script>

</head>
<body>
  <div id="header">
    <h1><a href="/control" style="text-decoration: none; color: #f1c40f"><span>Control</span> Panel</a></h1>
    <!-- <p id="button"> -->
     <ul class="dropdown" style="margin-top: 30px; margin-bottom: 20px; margin-right: 60px; margin-left:0">
      <li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu<b class="caret"></b></a>
        <ul class="dropdown-menu" style="background-color: #f3ca27; ">
        <li><a href="/fac/add">施設追加</a></li>
        <li><a href="/fac/list">施設一覧</a></li>
        <li><a href="/user/add">ユーザ追加</a></li>
        <li><a href="/user/list">ユーザ一覧</a></li>
        <li><a href="/board/list">掲示板一覧</a></li>
        </ul>
      </li>
     </ul>
      <a href="/login" class="login">Singin</a>
      <a href="/logout" class="logout">Singout</a>
    <!-- </p> -->
  </div>
</body>
</html>
