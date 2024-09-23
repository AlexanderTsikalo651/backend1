from flask import Flask, request

app = Flask(__name__)

@app.route('/data', methods=['POST'])
def save_data():
    text = request.form['text']
    with open('../data.txt', 'a') as file:
        file.write(text + '\n')
    return 'Data received and saved.'

if __name__ == '__main__':
    app.run(debug=True)
