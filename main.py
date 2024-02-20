from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user
import requests

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'  # Change this to a secure secret key

login_manager = LoginManager(app)

# Sample User class, replace with your actual User model
class User(UserMixin):
    pass

# Sample user database, replace with your actual user data storage
users = {
    'user1': {'password': 'pass1'},
    'user2': {'password': 'pass2'}
}

@login_manager.user_loader
def load_user(username):
    if username in users:
        user = User()
        user.id = username
        return user
    return None

# External REST API endpoint for user registration
EXTERNAL_REGISTER_API = 'https://your-external-api.com/register'
# External REST API endpoint for user login
EXTERNAL_LOGIN_API = 'https://your-external-api.com/login'

@app.route('/')
def home():
    return render_template('dashboard.html')

@app.route('/dashboard')
@login_required
def dashboard():
    return render_template('dashboard.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # username = request.form.get('username')
        # password = request.form.get('password')

        # # Make an external REST call to authenticate the user
        # response = requests.post(EXTERNAL_LOGIN_API, data={'username': username, 'password': password})

        # if response.status_code == 304:
        #     user = User()
        #     user.id = username
        #     login_user(user)
            return redirect(url_for('dashboard'))


    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
    #     username = request.form.get('username')
    #     password = request.form.get('password')

    #     # Make an external REST call to register the user
    #     response = requests.post(EXTERNAL_REGISTER_API, data={'username': username, 'password': password})
    #     if response.status_code == 304:
    #         # Assuming you have a User model and Flask-Login for user management
    #         user = User()
    #         user.id = username
    #         login_user(user)
            return render_template('dashboard')

    return render_template('register.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('home'))

# Sample initial data
device_data = {
    'temperature': [25, 22, 24, 23, 26],
    'humidity': [60, 55, 58, 62, 65]
}


@app.route('/api/data')
def get_device_data():
    return jsonify(device_data)

@app.route('/api/create_endpoint', methods=['POST'])
def create_endpoint():
    new_endpoint = request.form.get('new_endpoint')
    # Implement logic to validate and create new endpoint
    # For simplicity, we'll just add a new key to device_data
    device_data[new_endpoint] = [0] * 5  # Initialize with zeros for demonstration
    return jsonify({'success': True})

@app.route('/api/update_data', methods=['POST'])
def update_data():
    endpoint = request.form.get('endpoint')
    new_value = float(request.form.get('value'))
    # Implement logic to update data for the specified endpoint
    # For simplicity, we'll add the new value to the data list
    device_data[endpoint].append(new_value)
    device_data[endpoint] = device_data[endpoint][-5:]  # Keep only the last 5 values
    return jsonify({'success': True})
@app.route('/control_system')
def control_system():
    return render_template('control_system.html')
if __name__ == '__main__':
    app.run(debug=True)
