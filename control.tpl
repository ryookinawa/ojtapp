<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    % include('header.tpl')

    <title>Control Panel</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/2-col-portfolio.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
  <h1>管理機能</h1>
  <hr />
    <!-- Page Content -->
    <div class="container">
        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item">
                <a href="/fac/add">
                    <img class="img-responsive" src="img/facadd_icon.png" alt="">
                </a>
                <h5>
                    <a href="/fac/add">施設登録</a>
                </h5>
            </div>
            <div class="col-md-6 portfolio-item">
                <a href="/fac/list">
                    <img class="img-responsive" src="img/faclist_icon.png" alt="">
                </a>
                <h5>
                    <a href="/fac/list">施設一覧</a>
                </h5>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item">
                <a href="/user/add">
                    <img class="img-responsive" src="img/useradd_icon.png" alt="">
                </a>
                <h5>
                    <a href="/user/add">ユーザー登録</a>
                </h5>
            </div>
            <div class="col-md-6 portfolio-item">
                <a href="/user/list">
                    <img class="img-responsive" src="img/userlist_icon.png" alt="">
                </a>
                <h5>
                    <a href="/user/list">ユーザー一覧</a>
                </h5>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
  <hr />
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
% include('footer.tpl')

</html>
