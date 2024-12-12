import os
import subprocess
import openpyxl
from datetime import datetime


# Optionally, import ExcelUtils if needed in the future
# from libraries.read_excel_data import ExcelUtils

def run_tests(test_file, selected_tests=None):
    """Run specific or all tests with timestamped log files in a new folder."""

    # Generate the timestamp for both the files and the subdirectory
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

    # Define the new subdirectory inside results/
    result_dir = f"results/{timestamp}"

    # Create the result directory if it doesn't exist
    os.makedirs(result_dir, exist_ok=True)

    # Define the log, report, and output file names with timestamp
    log_file = os.path.join(result_dir, f"robot_log_{timestamp}.html")
    report_file = os.path.join(result_dir, f"report_{timestamp}.html")
    output_file = os.path.join(result_dir, f"output_{timestamp}.xml")

    # Build the command to execute the tests with the timestamped log and other files
    command = [
        "robot",
        f"--log={log_file}",
        f"--report={report_file}",
        f"--output={output_file}"
    ]

    if selected_tests:
        command.extend(["--test", " OR ".join(selected_tests)])

    command.append(test_file)

    # Execute the command
    subprocess.run(command)


def load_test_cases(file_path):
    """Fetch all unique test cases with non-empty names from Excel."""
    workbook = openpyxl.load_workbook(file_path)
    sheet = workbook.active

    # Use a set to store unique non-empty test case names
    test_cases = set(row[0] for row in sheet.iter_rows(min_row=2, values_only=True) if row[0])
    return list(test_cases)


if __name__ == "__main__":
    TEST_FILE = "NFH_service_Change_Address.robot"
    TEST_DATA_FILE = "D:/New_automation_/web-automation-framework/resources/test_data/NFH_service_Change_Address.xlsx"

    # Load test cases from Excel
    test_cases = load_test_cases(TEST_DATA_FILE)
    print("Available test cases:", test_cases)

    # Specify tests to run or leave empty to run all
    tests_to_run = []
    run_tests(TEST_FILE, tests_to_run)
