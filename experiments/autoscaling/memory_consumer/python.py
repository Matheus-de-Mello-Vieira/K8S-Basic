from flask import Flask
import sys
import signal

app = Flask(__name__)

content = []

@app.route('/')
def hello_world():
    for _ in range(int(1e6)):
        content.append('abc')

    return str(round(sys.getsizeof(content) / 1024 / 1024, 2)) + "Mib"

app.run(port=5000, host='0.0.0.0', debug=True)