<html>
% include('header.tpl')
<head>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="/css/python.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

</head>
<h1>施設登録画面</h1>

<form action='' method='POST' enctype="multipart/form-data">
<!-- <form action='' method='POST'> -->
  <div class="container">
    <table class="table">
      <thead>
        <tr>
          <th>施設名</th>
          <td><input type='text' name='facility_name' placeholder='施設名'/></td>
        <tr>
        <tr>
          <th>施設概要</th>
          <th><input type='text' name='facility_desc' placeholder='施設概要'/></th>
        <tr>
        <tr>
          <th>住所</th>
          <th><input type='text' name='facility_addr' placeholder='住所'/></th>
        <tr>
        <tr>
          <th>料金</th>
          <th><input type='text' name='facility_price' placeholder='料金'/></th>
        <tr>
        <tr>
          <th>写真</th>
          <!-- <th><input type='text' name='facility_image_name' placeholder='写真名'/></th> -->
          <th>
          <!-- <form action="" method="post" enctype="multipart/form-data"> -->
            <input type="file" name="facility_image_name">
            <!-- <input type="submit" value="Upload"> -->
          </form>
         </th>
        <tr>
      <thead>
    </table>
  </div>
<input type='submit' value='登録' />
</form>
% include('footer.tpl')
</html>
