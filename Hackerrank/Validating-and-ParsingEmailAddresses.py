import re
for i in range (int(input())):
    nadd=input()
    addr=re.search(r'(?<=<).*(?=>)', nadd)
    if re.match(r'[a-z]{1}[a-z0-9._-]*@[a-z]+[.][a-z]{1,3}$', addr.group(0)):
        print (nadd)
