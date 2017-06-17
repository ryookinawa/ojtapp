#!/usr/bin/env python
# coding:utf-8
import os
import sqlite3
import time # タイムスタンプ生成のため
import urllib.request, urllib.error #GeoCodingのため
import json # GeoCoding結果の読み込み
from datetime import *
from bottle import route, run, template, request, redirect, debug, error, response
from bottle import static_file, url



# app.pyが設置されているディレクトリの絶対パスを取得
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

@route('/css/<filename>')
def css_dir(filename):
    """ set css dir """
    return static_file(filename, root=BASE_DIR+"/css")

@route('/js/<filename>')
def css_dir(filename):
    """ set js dir """
    return static_file(filename, root=BASE_DIR+"/js")

@route('/img/<filename>')
def css_dir(filename):
    """ set img dir """
    return static_file(filename, root=BASE_DIR+"/img")

@route('/img/portfolio/<filename>')
def css_dir(filename):
    """ set img dir """
    return static_file(filename, root=BASE_DIR+"/img/portfolio")

@route('/img/team/<filename>')
def css_dir(filename):
    """ set img dir """
    return static_file(filename, root=BASE_DIR+"/img/team")

@route('/img/icon/<filename>')
def css_dir(filename):
    """ set img dir """
    return static_file(filename, root=BASE_DIR+"/img/icon")

@route('/fonts/font-awesome/css/<filename>')
def font_dir(filename):
    """ set font dir """
    return static_file(filename, root=BASE_DIR+"/fonts/font-awesome/css/")

@route('/fonts/font-awesome/fonts/<filename>')
def font_dir(filename):
    """ set font dir """
    return static_file(filename, root=BASE_DIR+"/fonts/font-awesome/fonts/")

@route('/mail/<filename>')
def mail_dir(filename):
    """ set mail_dir dir """
    return static_file(filename, root=BASE_DIR+"/mail/")



# / にアクセスしたら index関数が呼ばれる
@route("/")
def index():
    # ティザーサイトを表示する
    return template("index")

@route("/top")
def index():
    conn = sqlite3.connect('items.db')
    c = conn.cursor()
    c.execute("select faclitiyName,facilityDesc,address,price,imageName,id from facility order by id")
    fac_list = []
    for row in c.fetchall():
        fac_list.append({
            "facilityName": row[0],
            "facilityDesc": row[1],
            "facilityAddr": row[2],
            "facilityPrice": row[3],
            "facilityImgName": row[4],
            "id": row[5]
        })
    conn.close()

    GEOCODE_BASE_URL = 'https://maps.googleapis.com/maps/api/geocode/json'
    #address = urllib.parse.quote_plus("沖縄県糸満市",encoding="utf-8")
    address = urllib.parse.quote_plus(fac_list[0]["facilityAddr"],encoding="utf-8")
    key="Your Google Map Key"
    url=GEOCODE_BASE_URL + "?" + "address=%s&key=%s" % (address, key)
    response = urllib.request.urlopen(url)
    # JSON辞書型：jsonDataで取得
    jsonData = json.load(response)
    lat = str(jsonData['results'][0]['geometry']['location']['lat'])
    lng = str(jsonData['results'][0]['geometry']['location']['lng'])

    # TOPページの一覧を表示する
    return template("top_tmpl", lat=lat, lng=lng, fac_list=fac_list, reservaKey=reservaKey)

@route("/fac/detail/<fac_id:int>")
def detail(fac_id):
    conn = sqlite3.connect('items.db')
    c = conn.cursor()
    c.execute("select * from facility where id=?", (fac_id,))
    item_list = []
    for row in c.fetchall():
        item_list.append({
            "id": row[0],
            "facilityName": row[1],
            "facilityDesc": row[2],
            "facilityAddr": row[3],
            "facilityPrice": row[4],
            "facilityImgName": row[5]
        })
    conn.close()
    print(item_list)

    # 詳細サイトを表示する
    # 住所から緯度経度を変換する
    GEOCODE_BASE_URL = 'https://maps.googleapis.com/maps/api/geocode/json'
    #address = urllib.parse.quote_plus("沖縄県糸満市",encoding="utf-8")
    address = urllib.parse.quote_plus(item_list[0]["facilityAddr"],encoding="utf-8")
    key="Your Google Map Key"
    url=GEOCODE_BASE_URL + "?" + "address=%s&key=%s" % (address, key)
    response = urllib.request.urlopen(url)
    # JSON辞書型：jsonDataで取得
    jsonData = json.load(response)
    lat = str(jsonData['results'][0]['geometry']['location']['lat'])
    lng = str(jsonData['results'][0]['geometry']['location']['lng'])

    reservaKey = ["dbeJwzNDA2MQUAAvAA_g", "0deJwzNDA2MwYAAvIA_g", "0deJwzNDA2MwEAAvMA_w"]
    return template("detail", lat=lat, lng=lng, item_list=item_list, reservaKey=reservaKey)




@route("/user/list")
def view_list():
    username = request.get_cookie("account", secret='some-secret-key')
    print("list view user name is:" + str(username))
    if username:
        # items.dbとつなぐ(なければ作られる)
        conn = sqlite3.connect('items.db')
        c = conn.cursor()
        #c.execute("select id,firstName,lastName,mail,tel,birthday,sex from users order by id")
        c.execute("select * from users order by id")
        item_list = []
        for row in c.fetchall():
            item_list.append({
                "id": row[0],
                "firstName": row[3],
                "lastName": row[4],
                "mail": row[1],
                "tel": row[5],
                "birthday": row[6],
                "sex": row[7]
            })
        conn.close()
        # 表示はテンプレートを戻すだけ
        return template("u_list", item_list=item_list)
    else:
        return "You are not logged in. Access denied."


@route("/user/add", method=["GET", "POST"])
def add_item():
    username = request.get_cookie("account", secret='some-secret-key')
    print("add view user name is:" + str(username))
    if username:
        if request.method == "POST":
            # POSTアクセスならDBに登録する
            # フォームから入力されたアイテム名の取得(Python2ならrequest.POST.getunicodeを使う)
            userFirstName = request.POST.getunicode("user_firstName")
            userLastName = request.POST.getunicode("user_lastName")
            userMail = request.POST.getunicode("user_mail")
            userTel = request.POST.getunicode("user_tel")
            userPassword = request.POST.getunicode("user_password")
            userBirthday = request.POST.getunicode("user_birthday")
            userSex = request.POST.getunicode("user_sex")
            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            # id = c.execute("select max(id) from items")
            # 現在の最大ID取得(fetchoneの戻り値はタプル)
            new_id = c.execute("select max(id) + 1 from users").fetchone()[0]
            c.execute("insert into users values(?,?,?,?,?,?,?,?)", (new_id, userMail, userPassword, userFirstName, userLastName, userTel, userBirthday, userSex))
            conn.commit()
            conn.close()
            entry_name = ""
            entry_id = ""
            return template("u_res", user_firstName = userFirstName, user_lastName = userLastName, user_mail = userMail, user_tel = userTel, user_birthday = userBirthday, user_sex = userSex, entry_id = new_id)
        else:
            # GETアクセスならフォーム表示
            return template("u_add")
    else:
        return "You are not logged in. Access denied."



# /del/100 -> item_id = 100
# /del/one -> HTTPError 404
@route("/user/del/<item_id:int>")
def del_item(item_id):
    conn = sqlite3.connect('items.db')
    c = conn.cursor()
    # 指定されたitem_idを元にDBデータを削除
    c.execute("delete from users where id=?", (item_id,))
    conn.commit()
    conn.close()
    # 処理終了後に一覧画面に戻す
    return redirect("/user/list")



@route("/user/update/<user_id:int>/<user_firstName>", method=["GET", "POST"])
def update_item(user_id,user_firstName):
        if request.method == "POST":
            # POSTアクセスならDBに登録する
            # フォームから入力されたアイテム名の取得(Python2ならrequest.POST.getunicodeを使う)
            user_firstName = request.POST.getunicode("user_firstName")
            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            # 現在の最大ID取得(fetchoneの戻り値はタプル)
            c.execute("UPDATE users SET firstName = ? where id=?", (user_firstName, user_id))
            conn.commit()
            conn.close()
            return redirect("/user/list")
            #　return redirect("/list")
        else:
            # GETアクセスならフォーム表示
            return template("u_update",id=str(user_id), name=user_firstName)

##################################################
############### ここからは施設用の処理 ###############
##################################################
@route("/fac/add", method=["GET", "POST"])
def add_item():
    username = request.get_cookie("account", secret='some-secret-key')
    print("add view user name is:" + str(username))
    if username:
        if request.method == "POST":
            # POSTアクセスならDBに登録する
            # フォームから入力されたアイテム名の取得(request.POST.getunicodeからrequest.forms.getに変更)
            facilityName = request.forms.get("facility_name")
            facilityDesc = request.forms.get("facility_desc")
            facilityAddr = request.forms.get("facility_addr")
            facilityPrice = request.forms.get("facility_price")
            ###ファイルアップロードのオブジェクトを取得する
            facilityImgNameObj = request.files.get("facility_image_name","")
            ###写真をアップロードするメソッドから登録したファイル名を取得する
            facilityImgName = do_upload(facilityImgNameObj)
            ###DBへ接続してDBへ登録する
            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            # id = c.execute("select max(id) from items")
            # 現在の最大ID取得(fetchoneの戻り値はタプル)
            new_id = c.execute("select max(id) + 1 from facility").fetchone()[0]
            c.execute("insert into facility values(?,?,?,?,?,?)", (new_id, facilityName, facilityDesc, facilityAddr, facilityPrice, facilityImgName))
            #c.execute("insert into items(name) values(item_name)")
            conn.commit()
            conn.close()
            # return "<h1>SUCCESS!!!!!!!</h1>  <hr> <br> <a href='/add' >新規作成</a>   <br> <a href='/list' >一覧表示</a>"
            entry_name = ""
            entry_id = ""
            return template("f_res", facilityName = facilityName, entry_id = new_id)
        else:
            # GETアクセスならフォーム表示
            return template("f_add")
    else:
        return "You are not logged in. Access denied."
#########################################

#File Upload
# @get('/upload')
# def upload():
#     return '''
#         <form action="/upload" method="post" enctype="multipart/form-data">
#             <input type="submit" value="Upload"></br>
#             <input type="file" name="upload"></br>
#         </form>
#     '''

# @route('/upload', method=["GET", "POST"])
# def do_upload(file):
#     if request.method == "POST":
#             upload = request.files.get('upload', '')
#             if not upload.filename.lower().endswith(('.png', '.jpg', '.jpeg')):
#                 return 'File extension not allowed!'
#             save_path = BASE_DIR + "/img/"
#             upload.save(save_path)
#             return 'Upload OK. FilePath: %s%s' % (save_path, upload.filename)
#
#             #def get_save_path():
#             #    path_dir = BASE_DIR + "/img/"
#     else:
#         return '''
#             <form action="/upload" method="post" enctype="multipart/form-data">
#                 <input type="submit" value="Upload"></br>
#                 <input type="file" name="upload"></br>
#             </form>
#         '''

def get_value(upfile):
    upload = upfile
    return upload.filename

def do_upload(upfile):
    #upload = request.files.get('upfile', '')
    upload = upfile
    timestump = datetime.now().strftime( '%Y%m%d%H%M%S' )
    #name, ext = os.path.splitext(upload.filename)
    #if ext not in ('.csv'):
    #    return template("index",msg="The file extension is not allowed.")
    if not upload.filename.lower().endswith(('.png', '.jpg', '.jpeg')):
        return 'File extension not allowed!'
    save_path = BASE_DIR + "/img/"
    upload.filename = timestump + "-" +upload.filename
    upload.save(save_path, overwrite=True)
    return upload.filename



#########################################


@route("/fac/list")
def view_list():
    username = request.get_cookie("account", secret='some-secret-key')
    print("list view user name is:" + str(username))
    if username:
        # items.dbとつなぐ(なければ作られる)
        conn = sqlite3.connect('items.db')
        c = conn.cursor()
        # ToDo:論理削除の実装
        c.execute("select * from facility order by id")
        item_list = []
        for row in c.fetchall():
            item_list.append({
                "id": row[0],
                "facilityName": row[1],
                "facilityDesc": row[2],
                "facilityAddr": row[3],
                "facilityPrice": row[4],
                "facilityImgName": row[5]
                })
        conn.close()
        # 表示はテンプレートを戻すだけ
        return template("f_list", item_list=item_list)
    else:
        return "You are not logged in. Access denied."



@route("/fac/del/<facility_id:int>")
def del_item(facility_id):
    conn = sqlite3.connect('items.db')
    c = conn.cursor()
    # 指定されたitem_idを元にDBデータを削除
    c.execute("delete from facility where id=?", (facility_id,))
    conn.commit()
    conn.close()
    # 処理終了後に一覧画面に戻す
    return redirect("/fac/list")


@route("/fac/update/<facility_id:int>", method=["GET", "POST"])
def update_item(facility_id):
        if request.method == "POST":
            # POSTアクセスならDBに登録する
            # フォームから入力されたアイテム名の取得(Python2ならrequest.POST.getunicodeを使う)

            # ToDo:大樹から貰ったUpdate処理に変更する
            facilityName = request.POST.getunicode("facility_name")
            facilityDesc = request.POST.getunicode("facility_desc")
            facilityAddr = request.POST.getunicode("facility_addr")
            facilityPrice = request.POST.getunicode("facility_price")
            facilityImgName = request.POST.getunicode("facility_image_name","")


            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            # 現在の最大ID取得(fetchoneの戻り値はタプル)
            c.execute("UPDATE facility SET faclitiyName = ?, facilityDesc = ?, address = ?, price = ?, imageName = ?  where id=?", (facilityName, facilityDesc, facilityAddr, facilityPrice, facilityImgName, facility_id))
            #c.execute("UPDATE items SET name = ? where id=?", (item_id))
            conn.commit()
            conn.close()
            return redirect("/fac/list")
            #　return redirect("/list")
        else:
            # GETアクセスならフォーム表示
            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            # 現在の最大ID取得(fetchoneの戻り値はタプル)
            c.execute("select * from facility where id=?", (facility_id,))
            #c.execute("select name from items where id=?", (item_id,)).fetchone()[0]
            #c.execute("UPDATE items SET name = ? where id=?", (item_id))
            fac_list = []
            for row in c.fetchall():
                fac_list.append({
                    "id": row[0],
                    "facilityName": row[1],
                    "facilityDesc": row[2],
                    "facilityAddr": row[3],
                    "facilityPrice": row[4],
                    "facilityImgName": row[5]
                    })
            conn.commit()
            conn.close()

            return template("f_update",fac_list=fac_list)

@route("/control")
def control():
    # 管理画面を表示する
    return template("control")


@route("/login" , method=["GET", "POST"])
def login():
        if request.method == "POST":
            username = request.forms.get("username")
            password = request.forms.get("password")
            if check_login(username, password):
                response.set_cookie("account", username, secret="some-secret-key")
                cookie_by_get = request.get_cookie('account', secret="some-secret-key")
                print("login User is:" + str(cookie_by_get))
                return redirect("/control")
            else:
                return "<p>Failed !</p>"
        else:
            # return """
            #     <form action="/login" method="post">
            #         Username: <input name="username" type="text" />
            #         Password: <input name="password" type="password" />
            #         <input value="Login" type="submit" />
            #         </form>
            #         """
            return template("login")




@route("/board/<facility_id:int>", method=["GET", "POST"])
def board(facility_id):
    #username = request.get_cookie("account", secret='some-secret-key')
    #print("add view user name is:" + str(username))
    #if username:
        if request.method == "POST":
            # POSTアクセスならDBに登録する
            # フォームから入力されたアイテム名の取得(request.POST.getunicodeからrequest.forms.getに変更)
            tk = request.POST.getunicode("toukou")
            pt = request.POST.getunicode("post")
            if tk == 'toukou':
                name = request.POST.getunicode("name")
                messageJp = request.POST.getunicode("messageJp")
                #messageEn = request.forms.get("message2")

                TRANSLATE_BASE_URL = 'https://translation.googleapis.com/language/translate/v2'
                #address = urllib.parse.quote_plus("沖縄県糸満市",encoding="utf-8")
                msg = urllib.parse.quote_plus(messageJp,encoding="utf-8")
                key="Your Google Translation Key"
                target="en"
                url=TRANSLATE_BASE_URL + "?" + "key=%s&target=%s&q=%s" % (key, target, msg)
                response = urllib.request.urlopen(url)
                # JSON辞書型：jsonDataで取得
                jsonData = json.load(response)
                print(jsonData)

                #messageEn = "message2"
                messageEn =  str(jsonData['data']['translations'][0]['translatedText'])
                print("Translation" + messageEn)
                #ip = request.forms.get("ip")
                ip = "192.168.1.1"
                #date = timestump = datetime.now().strftime( '%Y%m%d%H%M%S' )
                date = "2017/7/1"

                conn = sqlite3.connect('items.db')
                c = conn.cursor()
                # id = c.execute("select max(id) from items")
                # 現在の最大ID取得(fetchoneの戻り値はタプル)
                new_id = c.execute("select max(id) + 1 from board").fetchone()[0]
                # print(name)
                # print(messageJp)
                # print(messageEn)
                # print(ip)
                # print(date)
                # print(new_id)
                # print(facility_id)
                c.execute("insert into board values(?,?,?,?,?,?,?)", (new_id, name, messageJp, messageEn, ip, date, facility_id))
                conn.commit()
                conn.close()
                return redirect("/board/" + str(facility_id))

            elif pt == "post":
                name = request.POST.getunicode("name")
                messageEn = request.POST.getunicode("messageEn")
                #messageEn = request.forms.get("message2")

                TRANSLATE_BASE_URL = 'https://translation.googleapis.com/language/translate/v2'
                #address = urllib.parse.quote_plus("沖縄県糸満市",encoding="utf-8")
                msg = urllib.parse.quote_plus(messageEn,encoding="utf-8")
                key="Your Google Translation Key"
                target="ja"
                url=TRANSLATE_BASE_URL + "?" + "key=%s&target=%s&q=%s" % (key, target, msg)
                response = urllib.request.urlopen(url)
                # JSON辞書型：jsonDataで取得
                jsonData = json.load(response)
                print(jsonData)

                #messageEn = "message2"
                messageJp =  str(jsonData['data']['translations'][0]['translatedText'])
                print("Translation" + messageJp)
                #ip = request.forms.get("ip")
                ip = "192.168.1.1"
                #date = timestump = datetime.now().strftime( '%Y%m%d%H%M%S' )
                date = "2017/7/1"

                conn = sqlite3.connect('items.db')
                c = conn.cursor()
                # id = c.execute("select max(id) from items")
                # 現在の最大ID取得(fetchoneの戻り値はタプル)
                new_id = c.execute("select max(id) + 1 from board").fetchone()[0]
                # print(name)
                # print(messageJp)
                # print(messageEn)
                # print(ip)
                # print(date)
                # print(new_id)
                # print(facility_id)
                c.execute("insert into board values(?,?,?,?,?,?,?)", (new_id, name, messageJp, messageEn, ip, date, facility_id))
                conn.commit()
                conn.close()
                return redirect("/board/" + str(facility_id))
        else:
    #       # GETアクセスならフォーム表示
            conn = sqlite3.connect('items.db')
            c = conn.cursor()
            c.execute("select * from board where facid=? order by id desc", (facility_id,) )
            board_list = []
            for row in c.fetchall():
                board_list.append({
                    "id": row[0],
                    "name": row[1],
                    "messageJp": row[2],
                    "messageEn": row[3],
                    "ip": row[4],
                    "date": row[5]
                    #"facility_id": row[6]
                    })
            conn.commit()
            conn.close()
            #print(board_list)
            return template("board" , board_list=board_list)
    #else:
    #    return "You are not logged in. Access denied."

@route("/board/list")
def board_list():
    username = request.get_cookie("account", secret='some-secret-key')
    print("list view user name is:" + str(username))
    if username:
        # items.dbとつなぐ(なければ作られる)
        conn = sqlite3.connect('items.db')
        c = conn.cursor()
        # ToDo:論理削除の実装
        c.execute("select * from board order by id")
        board_list = []
        for row in c.fetchall():
            board_list.append({
                "id": row[0],
                "name": row[1],
                "messageJp": row[2],
                "messageEn": row[3],
                "ip": row[4],
                "date": row[5],
                "facid": row[6]
            })
        conn.close()
        # 表示はテンプレートを戻すだけ
        return template("b_list", board_list=board_list)
    else:
        return "You are not logged in. Access denied."

@route("/board/del/<board_id:int>")
def del_item(board_id):
    conn = sqlite3.connect('items.db')
    c = conn.cursor()
    # 指定されたitem_idを元にDBデータを削除
    c.execute("delete from board where id=?", (board_id,))
    conn.commit()
    conn.close()
    # 処理終了後に一覧画面に戻す
    return redirect("/board/list")





def check_login(username, password):
    if username == "admin" and password=="password":
        return True
    else:
        return False

@route("/logout")
def logout():
    response.delete_cookie("account");
    return redirect("/top")


@route("/404")
def error404():
    return '404 error'

@error(404)
def error404(error):
    #return redirect("/404")
    return '404 error'

# @error(500)
# def error500(error):
#     return '500 error'


# サーバを起動
debug(True)
run(host='0.0.0.0',reloader=True, port=7777)
