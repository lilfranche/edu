from html.parser import HTMLParser
class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        print (tag)
        if attrs!=[]:
            for elem in attrs:
                print ('->', elem[0], '>', elem[1])
parser = MyHTMLParser()
for j in range (int(input())):
    parser.feed (input())