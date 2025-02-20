#!/bin/bash

python3 mysql_py.py
python3 sql2csv.py
python3 storj5.py
python3 csv2html.py

mysqldump -u *** -p*** cryptodb > /home/***/backup-cryptodb.sql
mysqldump --compatible=postgresql -u *** -p*** cryptodb > /home/***/psql-cryptodb.sql

