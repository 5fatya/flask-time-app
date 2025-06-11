## Running the Project with Docker

This project is containerised using Docker and Docker Compose. The setup uses Python 3.13 (slim) and installs dependencies from `requirements.txt` into a virtual environment. The application code is in `app.py`.

## 🌐 Live Demo

👉 [https://flask-time-app-z474.onrender.com](https://flask-time-app-z474.onrender.com)


### Requirements and Configuration
- **Python Version:** 3.13 (as specified in the Dockerfile)
- **Dependencies:** Listed in `requirements.txt` (ensure it is up to date)
- **No required environment variables** are specified in the Dockerfile or compose file by default. If you need to use environment variables, uncomment and configure the `env_file` section in `docker-compose.yml`.

### Build and Run Instructions
1. **Build and start the service:**
   ```sh
   docker compose up --build
   ```
   This will build the image and start the `python-app` service.

2. **Accessing the Application:**
   - The application exposes port **5000**. It will be available at `http://localhost:5000` on your host machine.

### Additional Notes
- The container runs as a non-root user for improved security.
- No volumes or external dependencies are configured by default.
- If you need to persist data or add environment variables, update the `docker-compose.yml` accordingly.
