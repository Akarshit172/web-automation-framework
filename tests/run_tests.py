import os
import subprocess

import openpyxl

#from libraries.read_excel_data import ExcelUtils

def run_tests(test_file, selected_tests=None):
    """Run specific or all tests."""
    command = ["robot"]
    if selected_tests:
        command.extend(["--test", " OR ".join(selected_tests)])
    command.append(test_file)
    subprocess.run(command)

def load_test_cases(file_path):
    """Fetch all unique test cases with non-empty names from Excel."""
    workbook = openpyxl.load_workbook(file_path)
    sheet = workbook.active
    # Use a set to store unique non-empty test case names
    test_cases = set(row[0] for row in sheet.iter_rows(min_row=2, values_only=True) if row[0])
    return list(test_cases)

if __name__ == "__main__":
    TEST_FILE = "test_login.robot"
    TEST_DATA_FILE = "D:/New_automation_/web-automation-framework/resources/test_data/test_data.xlsx"

    # Load test cases from Excel
    test_cases = load_test_cases(TEST_DATA_FILE)
    print("Available test cases:", test_cases)

    # Specify tests to run or leave empty to run all
    tests_to_run = ["Valid PTP Test 3"]
    run_tests(TEST_FILE, tests_to_run)
