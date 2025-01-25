from flask import *# Flask # Импорт библиотеки Flask
import mysql.connector

app = Flask(__name__) # Создание экземпляра приложения

@app.route('/') # Определение маршрута
def main():
    return render_template('index.html', query="")

@app.route('/', methods=['POST'])
def post():
    username = request.form['text']
    # Execute a query
    cur.execute("SELECT email FROM users WHERE username='{}'".format(username))
    
    # Fetch one result
    result = cur.fetchall()
    # print("Current date is: {0}".format(row[0]))
    return render_template('index.html', result=result)

if __name__ == '__main__': # Запуск приложения
    # Connect to server
    cnx = mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="root_password",
        database="my_database")
    # 
    # # Get a cursor
    cur = cnx.cursor()
    app.run(debug=True, host='0.0.0.0', port=8080)
    # Close connection
    cnx.close()
