from flask import Flask

app = Flask(__name__)

@app.route('/')
def order_service():
    return 'Hello from Order-Service'

app.run(host='0.0.0.0', port=8080)
