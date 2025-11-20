file = open('library_loans.csv', 'r')
lines = file.readlines()
file.close()

# Convert lines to list of lists
data = []
for line in lines:
    cells = line.strip().split(',')
    data.append(cells)

# Separate header and data
headers = data[0]
loans = data[1:]

# Convert days to int and filter for home-loan
days_index = headers.index('days')
loan_type_index = headers.index('loan_type')

home_loans = []
for row in loans:
    row[days_index] = int(row[days_index])
    if row[loan_type_index] == 'home-loan':
        home_loans.append(row)

# Write filtered data to a new CSV
output = [headers] + home_loans
out_file = open('home_loans.csv', 'w')
for row in output:
    out_file.write(','.join(map(str,row)) + '\n')