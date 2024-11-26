import openpyxl

def read_excel(file_path, sheet_name):
    workbook = openpyxl.load_workbook(file_path)
    sheet = workbook[sheet_name]
    
    # Get the headers from the first row and strip any leading/trailing spaces
    headers = [cell.value.strip() if cell.value else '' for cell in sheet[1]]  # Stripping spaces from headers
    
    data = []
    for row in sheet.iter_rows(min_row=2, values_only=True):  # Starting from the second row (data)
        row_data = dict(zip(headers, row))  # Create a dictionary from the header and row
        data.append(row_data)

    return data
