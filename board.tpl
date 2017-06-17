<!DOCTYPE html>
<html>
  <head>
    <title>board</title>
    <!-- <link rel="stylesheet" href="/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="/css/bootstrap-responsive.min.css"> -->
    <!-- <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css"> -->
    <!--<style>
      body { padding-top: 40px; }
      @media screen and (max-width: 979px) {
        body { padding-top: 0px; }
      }

    </style>-->
    <script type="text/javascript" language="javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/moment.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" language="javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <!-- <script type="text/javascript" language="javascript" src="/js/page.js"></script> -->
  </head>
<body>

  <script type="text/javascript">
    $(function() {
      $('#toggle-event').change(function() {
        $('.japanese').toggle();
        $('.english').toggle();
  	  })
    })
</script>

<!-- <div class="container-fluid bg-info"> -->
<div class="container">
 Select Japanese or English =>> <input id="toggle-event" type="checkbox" checked data-toggle="toggle" data-on="Japanese" data-off="English" data-onstyle="success" data-offstyle="info">
  <div class="row">
    <div id="japanese" class="japanese col-md-4">
      <br>
      <!-- 日本語用のトピック作成画面 -->
      <div class="panel panel-primary" style="background-color: #f1c40f;">
        <div class="panel-heading" style="background-color:#294D57;">トピックの作成</div>
        <div class="panel-body">
          <form method="post" action="">
            <div class="form-group">
              <label for="TopicTitle">投稿者</label>
              <input type="text" class="form-control" name="name" placeholder="名前を入力してください。" />
            </div>
            <div class="form-group">
              <label for="TopicOverview">メッセージ</label>
              <textarea type="text" class="form-control" name="messageJp" placeholder="質問したいことを日本語で記入してください"></textarea></textarea>
            </div>
            <div class="pull-right">
            <button type="submit" name="toukou" value="toukou" class="btn btn-success btn-primary">投稿</button>
            </div>
          </form>
        </div><!-- /. panel-body -->
      </div><!-- /. panel-default -->
    </div>

    <!-- 英語用のトピック作成画面 -->
    <div id="english" class="english col-md-4" style="display: none;">
      <br>
      <div class="panel panel-primary" style="background-color: #f1c40f;">
        <div class="panel-heading" style="background-color:#294D57;">Create Topic</div>
        <div class="panel-body">
          <form method="post" action="">
            <div class="form-group">
              <label for="TopicTitle">Contributor</label>
              <input type="text" class="form-control" name="name" placeholder="Input Your Name" />
            </div>
            <div class="form-group">
              <label for="TopicOverview">Message</label>
              <textarea type="text" class="form-control" name="messageEn" placeholder="Please fill in what you want to ask in English"></textarea>
            </div>
            <div class="pull-right">
            <button type="submit" name="post" value="post" class="btn btn-success btn-primary">Post</button>
            </div>
          </form>
        </div><!-- /. panel-body -->
      </div><!-- /. panel-default -->
    </div>

    <!-- 日本語用のスレッド表示画面 -->
    <div class="japanese col-md-8">
        <br>
        % for board in board_list:
          <div class="panel panel-success" style="background-color: #f1c40f;">
            <div class="panel-heading" style="background-color:#294D57;">
              <h3 class="panel-title" style="color: #ffffff;">{{board["name"]}}</h3>
            </div>
            <div class="panel-body">
              <p>{{board["messageJp"]}}</p>
            </div>
            <div class="panel-body">
              <p style="margin-left:10px">翻訳結果:</p>
              <p style="margin-left: 10px; color: #337AB7;">{{board["messageEn"]}}</p>
            </div>
          </div>
        %end
    </div>

    <!-- 英語用のスレッド表示画面 -->
    <div class="english col-md-8" style="display: none;">
        <br>
        % for board in board_list:
          <div class="panel panel-success" style="background-color: #f1c40f;">
            <div class="panel-heading" style="background-color:#294D57;">
              <h3 class="panel-title" style="color: #ffffff;">{{board["name"]}}</h3>
            </div>
            <div class="panel-body">
              <p>{{board["messageEn"]}}</p>
            </div>
            <div class="panel-body">
              <p style="margin-left:10px">翻訳結果:</p>
              <p style="margin-left: 10px; color: #337AB7;">{{board["messageJp"]}}</p>
            </div>
          </div>
        %end
    </div>

  </div>
</div>

<!-- % include template/footer.tpl -->
</html>
