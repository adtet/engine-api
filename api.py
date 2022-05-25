import mysql.connector
from flask import Flask,jsonify
import json
app = Flask(__name__)


def sql_connection():
    sql = mysql.connector.connect(host="localhost",
                                  user="adt",
                                  password="adtPa$$word2781",
                                  database="db_engine")
    return sql

def input_data(tegangan,celcius,fahrenheit):
    db = sql_connection()
    cursor = db.cursor()
    try:
        cursor.execute("INSERT INTO `tb_monitor`(`tegangan`, `celcius`, `fahrenheit`, `dt_update`) VALUES (%s,%s,%s,now())",(tegangan,celcius,fahrenheit))
        db.commit()
        b = True
    except(mysql.connector.Warning,mysql.connector.Error) as e:
        print(e)
        b = False
        
    return b

def get_data():
    db =  sql_connection()
    cursor = db.cursor()
    try:
        cursor.execute("SELECT `no`, `tegangan`, `celcius`, `fahrenheit`, `dt_update` FROM `tb_monitor` ORDER BY `no` DESC LIMIT 1")
        rows = [x for x in cursor]
        cols = [x[0] for x in cursor.description]
    except(mysql.connector.Error,mysql.connector.Warning) as e:
        rows = []
        cols = []
    datas = []
    for row in rows:
        data = {}
        for prop, val in zip(cols, row):
            data[prop] = val
        datas.append(data)
    for x in range(0,len(datas)):
        datas[x]['tegangan'] = str(datas[x]['tegangan'])
        datas[x]['celcius'] = str(datas[x]['celcius'])
        datas[x]['fahrenheit'] = str(datas[x]['fahrenheit'])
        datas[x]['dt_update'] = str(datas[x]['dt_update'])
    dataJson = json.dumps(datas)
    return dataJson

@app.route('/engine/input/<tegangan>/<celcius>/<fahrenheit>',methods=['GET'])
def data_input(tegangan,celcius,fahrenheit):
    cek_input = input_data(tegangan,celcius,fahrenheit)
    if cek_input == False:
        result = {"message":"Error input"}
        resp = jsonify(result)
        return resp,205
    else:
        result = {"message":"OK"}
        resp = jsonify(result)
        return resp,200
    

@app.route('/engine/data',methods=['GET'])
def data_get():
    result = get_data()
    return result,200


if __name__ == "__main__":
    app.run(port=6000, debug=False,host="0.0.0.0")