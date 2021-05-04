class GetPricePerformance:
    def get_price_performance(self, file, time_stamp):
        with open(file) as f:
            for i, line in enumerate(f, 1):
                if time_stamp in line:
                    line_num = i
                if i == line_num + 7:
                    return line

    def write_file(self, fname, file_path):
        file_path += '/text.txt'
        with open(file_path, 'w') as f:
            f.write(str(fname).replace("\n\n", "\n"))
        return file_path
    name = str('co\n\nmot\nnguoi\nvan\nyeu\n\nmot\nnguoi')
    print(name.replace('\n\n','\n'))