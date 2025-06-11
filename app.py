from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    now = datetime.now()
    return f"<h1>The current time is:</h1><p>{now.strftime('%Y-%m-%d %H:%M:%S')}</p>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
