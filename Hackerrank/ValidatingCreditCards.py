import re
for i in range (int(input())):
    num=input()
    if re.match(r'[456]([\d]{15}|[\d]{3}(-[\d]{4}){3})$', num) and not re.search(r'([\d])\1\1\1', num.replace('-', '')):
        print ('Valid')
    else:
        print ('Invalid')

