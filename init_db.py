#!/usr/bin/env python
# coding:utf-8

import sqlite3

# items.dbとつなぐ(なければ作られる)
conn = sqlite3.connect('items.db')
c = conn.cursor()

# テーブル作成
# c.execute("create table items(id, name)")
c.execute("create table items(id integer primary key autoincrement, name)")

c.execute("insert into items(name) values('りんご')")
c.execute("insert into items(name) values('ばなな')")
c.execute("insert into items(name) values('すいか')")

c.execute("create table facility(id integer not null primary key autoincrement, faclitiyName, facilityDesc, address, price, imageName)")


# 確定
conn.commit()

# バイバイ
conn.close()
