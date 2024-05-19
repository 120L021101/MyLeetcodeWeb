from flask import Flask, render_template, request, jsonify  
from pageReq import requestHome, requestProblem
from checkAnswer.check import check
app = Flask(__name__)  
  
@app.route('/')  
def home():  
    return requestHome.request()

@app.route('/problem')
def problem():
    id = request.args.get("id")
    if id is None:
        id = 1 # 如果不存在，返回第一道题
    return requestProblem.request(id)
  
@app.route('/submit_code', methods=['POST'])  
def submit_code():  
    id = request.args.get("id")
    language = request.args.get("language")
    code = request.data.decode('utf-8')  
    print(f"Received code: {code}")  
    testCode, testMsg = check(id, language, code)
    return jsonify({'message': 'Code received'}), 200  
  
if __name__ == '__main__':  
    app.run(host='127.0.0.1', port=9000, debug=True)