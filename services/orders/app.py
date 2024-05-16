import logging
from flask import Flask
from os import environ

logging.basicConfig(filename='/var/log/orders-service.log', level=logging.DEBUG)
app = Flask(__name__)

@app.route('/', methods=['GET'])
def order_service():
    api_key = environ.get('API_KEY')

    app.logger.info('Accès à la page d\'accueil')
    app.logger.info(f'Api key is: {api_key}')
    
    print('Api key is: ', api_key)

    return 'Hello from Order-Service'

app.run(host='0.0.0.0', port=8080)
