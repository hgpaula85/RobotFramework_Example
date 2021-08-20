import os
import json

# Default variables
browser = "chrome"
url = "http://automationpractice.com"

# Paths
current_path = os.path.dirname(os.path.realpath(__file__))
project_path = os.sep.join(current_path.split(os.sep)[:-2])
variables_path = os.path.join(project_path, 'resources', 'variables')
names_file = os.path.join(variables_path, 'names.txt')

# Test data
users_path = os.path.join(current_path, "user.json")
json_file = open(users_path)
dict_user = json.load(json_file)
