from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):
    def handle_comment(self, data):
        print(">>> Single-line Comment" if "\n" not in data else ">>> Multi-line Comment")
        print(data)
    def handle_data (self, data):
        if data.strip():        #if data is not only white space
            print(">>> Data")
            print(data)

html = ""       
for i in range(int(input())):
    html += input().rstrip()
    html += '\n'
    
parser = MyHTMLParser()
parser.feed(html)
parser.close()
