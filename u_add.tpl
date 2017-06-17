<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

</head>
<h1>ユーザー新規登録</h1>

<form action='' method='POST'>
  <div class="container">
    <table class="table">
      <thead>
        <tr>
          <th>名前</th>
          <td><input type='text' name='user_firstName' placeholder='名前'/></td>
        <tr>
        <tr>
          <th>苗字</th>
          <th><input type='text' name='user_lastName' placeholder='苗字'/></th>
        <tr>
        <tr>
          <th>メールアドレス</th>
          <th><input type='text' name='user_mail' placeholder='メールアドレス'/></th>
        <tr>
        <tr>
          <th>電話番号</th>
          <th><input type='text' name='user_tel' placeholder='電話番号'/></th>
        <tr>
        <tr>
          <th>パスワード</th>
          <th><input type='text' name='user_password' placeholder='パスワード'/></th>
        <tr>
        <tr>
          <th>誕生日</th>
          <th><input type='text' name='user_birthday' placeholder='yyyy/mm/dd'/></th>
        <tr>
        <tr>
          <th>性別</th>
          <th><input type="radio" name="user_sex" value="Male">男
              <input type="radio" name="user_sex" value="Female">女</th>
        <tr>
      <thead>
    </table>
  </div>
<input type='submit' value='登録' />
<!-- <hr> -->
<!-- <br> <a href='/user/add'>新規作成</a>   <br> <a href='/user/list'>一覧表示</a> -->
</form>
% include('footer.tpl')
</html>
