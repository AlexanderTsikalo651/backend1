from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/data', methods=['POST'])
def save_data():
    text = request.form['text']
    with open('data.txt', 'a') as file:
        file.write(text + '\n')
    return 'Data received and saved.'

@app.route('/data', methods=['GET'])
def get_data():
    with open('data.txt', 'r') as file:
        data = file.readlines()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
