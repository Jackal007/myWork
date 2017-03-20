import time
import threading
import requests
import subprocess
 


url="http://www.cnblogs.com/jacklovelol/p/6274906.html"

class MyThread(threading.Thread):
    def run(self):
        while True:
            try:
                response=requests.get(url)
            finally:
                time.sleep(0.01)

threads=[MyThread() for i in range(99)]
while True:	
	try:
		for t in threads:
			t.start()
	finally:
		pass


