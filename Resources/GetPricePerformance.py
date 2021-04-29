class GetPricePerformance:
    def get_price_performance(self, file, time_stamp):
        with open(file) as f:
            for i, line in enumerate(f, 1):
                if time_stamp in line:
                    line_num = i
        with open(file) as f:
            for i, line in enumerate(f, 1):
                if i == line_num+7:
                    return line

    def write_file(self, fname):
        with open('text.txt', 'w') as f:
            f.write(str(fname).replace("\n\n", "\n"))
        return 'text.txt'

    def main(self):
        text = self.get_price_performance('text.txt')
        print(text)
