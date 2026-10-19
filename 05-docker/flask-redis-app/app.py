from flask import Flask
import redis

app = Flask(__name__)

r = redis.Redis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def welcome():
    return 'Welcome to the CoderCo Containers Challenge!'

@app.route('/count')
def count():
    visits = r.incr('visits')
    return f'This page has been visited {visits} times.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)