from flask import *# Flask # Импорт библиотеки Flask
import mysql.connector

app = Flask(__name__) # Создание экземпляра приложения

@app.route('/') 
def main():
    return render_template('index.html', query="")

@app.route('/nonwaf/1')
@app.route('/nwaf/1') 
def test1_get():
    return render_template('1.html', query="")

@app.route('/nonwaf/1', methods=['POST'])
@app.route('/nwaf/1', methods=['POST'])
def test1_post():
    username = request.form['text']
    cur.execute("SELECT email FROM users WHERE username='{}'".format(username))
    
    result = cur.fetchall()
    return render_template('1.html', result=result)

@app.route('/nonwaf/2')
@app.route('/nwaf/2') 
def test2_get():
    return render_template('2.html', query="")

@app.route('/nonwaf/2', methods=['POST'])
@app.route('/nwaf/2', methods=['POST'])
def test2_post():
    username = request.form['text']
    cur.execute("SELECT * FROM users WHERE username='{}'".format(username))
    
    result = cur.fetchall()
    return render_template('2.html', result=result)

@app.route('/nonwaf/3')
@app.route('/nwaf/3') 
def test3_get():
    return render_template('3.html', query="")

@app.route('/nonwaf/3', methods=['POST'])
@app.route('/nwaf/3', methods=['POST'])
def test3_post():
    username = request.form['text']
    cur.execute("SELECT email FROM users WHERE username='{}'".format(username))
    
    result = cur.fetchall()
    return render_template('3.html', result=result)

@app.route('/nonwaf/4')
@app.route('/nwaf/4') 
def test4_get():
    return render_template('4.html', query="")

@app.route('/nonwaf/4', methods=['POST'])
@app.route('/nwaf/4', methods=['POST'])
def test4_post():
    username = request.form['text']
    cur.execute("SELECT email FROM users WHERE username='{}'".format(username))
    
    result = cur.fetchall()
    return render_template('4.html', result=result)

if __name__ == '__main__': # Запуск приложения
    # Connect to server
    cnx = mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="root_password",
        database="web_attack_test")
    # 
    # # Get a cursor
    cur = cnx.cursor()
    app.run(debug=True, host='0.0.0.0', port=8080)
    # Close connection
    cnx.close()
