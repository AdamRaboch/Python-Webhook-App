from flask import Flask, request, jsonify
import json
import os

app = Flask(__name__)

# Log file path
LOG_FILE = 'log.txt'

# Ensure log file exists
if not os.path.exists(LOG_FILE):
    with open(LOG_FILE, 'w') as f:
        f.write('')

@app.route('/', methods=['POST'])
def handle_github_webhook():
    # Verify the request is from GitHub
    if request.headers.get('X-GitHub-Event') == 'push':
        data = request.json
        repository_name = data['repository']['full_name']
        commit_id = data['head_commit']['id']
        changed_files = data['head_commit']['modified'] + data['head_commit']['added'] + data['head_commit']['removed']

        # Log the event details
        with open(LOG_FILE, 'a') as log:
            log.write(f"Repository: {repository_name}\n")
            log.write(f"Commit ID: {commit_id}\n")
            log.write(f"Changed Files: {', '.join(changed_files)}\n")
            log.write("-" * 40 + "\n")

        return jsonify({'message': 'Push event logged'}), 200
    else:
        return jsonify({'message': 'Not a push event'}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
