# your code goes here
import sys
import json

data = sys.stdin.readlines()
data = ''.join(data)
data = json.loads(data)

res = {}

for entry in data:
	index = entry['|']
	if index != "":
		res[index] = {}
		if 'sfx' in entry and entry['sfx'] != "":
			res[index]['sfx'] = entry['sfx']
		if 'type' in entry and entry['type'] != "":
			res[index]['type'] = entry['type']
		if 'name' in entry:
			res[index]['name'] = entry['name']
		else: 
			res[index]['name'] = ''
		if 'expression' in entry:
			res[index]['expression'] = entry['expression']
		else:
			res[index]['expression'] = ''
		if 'text' in entry:
			res[index]['text'] = entry['text']
		else:
			res[index]['text'] = ''
	else:
		continue 

print json.dumps(res)