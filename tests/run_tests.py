import subprocess
import sys
import os


# Function to execute Robot Framework test cases
def run_robot_tests(test_cases):
    # Absolute path to the Robot test file
    robot_file_path = r"D:/New_automation_/web-automation-framework/tests/test_login.robot"

    # Ensure the file exists at the specified path
    if not os.path.exists(robot_file_path):
        print(f"Error: The file {robot_file_path} does not exist.")
        sys.exit(1)

    # Base Robot command
    command = ['robot']

    # Add test cases dynamically to the command
    if test_cases:
        for test_case in test_cases:
            command.extend(['--test', test_case])
            command.extend([robot_file_path])

    # Print the command for debugging
    print(f"Running command: {' '.join(command)}")

    # Execute the command
    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error running Robot tests: {e}")
        sys.exit(1)


# Main function
if __name__ == "__main__":
    # Define an array with the test case names to be executed
    test_cases_to_run = [
        "Valid Site Visit Test 2" # Test Case 2
    ]

    # Run the specified test cases
    run_robot_tests(test_cases_to_run)
