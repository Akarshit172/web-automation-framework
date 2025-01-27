import openpyxl

def get_test_data(file_path, test_case_name):
    """Fetch test data for a specific test case.

    Args:
        file_path (str): Path to the Excel file.
        test_case_name (str): Name of the test case to filter the data.

    Returns:
        list: A list of dictionaries containing test data for the specified test case.
    """
    workbook = openpyxl.load_workbook(file_path)
    sheet = workbook.active

    # Get headers (column names)
    headers = [cell.value for cell in sheet[1]]

    # Collect all matching rows for the test case
    test_data = []
    for row in sheet.iter_rows(min_row=2, values_only=True):
        if row[0] == test_case_name:  # Match TestCaseName column
            test_data.append({
                headers[i]: (row[i] if row[i] is not None else "")  # Replace None with ""
                for i in range(len(headers))
            })
    return test_data
