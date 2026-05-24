#!/usr/bin/env python3
import http.server
import socketserver
import os
import threading
import time
import urllib.request

def start_server():
    os.chdir('public')
    handler = http.server.SimpleHTTPRequestHandler
    with socketserver.TCPServer(('', 8083), handler) as httpd:
        print('Server started on port 8083')
        httpd.timeout = 1
        for _ in range(30):
            httpd.handle_request()

thread = threading.Thread(target=start_server)
thread.start()
time.sleep(2)

try:
    response = urllib.request.urlopen('http://localhost:8083/')
    print(f'Website test: HTTP {response.getcode()}')
    html = response.read().decode('utf-8')
    
    # Check title
    if 'Rumah Subsidi Modern Ciomas Bogor' in html:
        print('✅ Website title verified')
    else:
        print('⚠️  Title not found')
        print(f'Title found: {html[:200]}')
    
    # Check key elements
    checks = [
        ('<meta charset="UTF-8">', 'Charset'),
        ('<meta name="viewport"', 'Viewport'),
        ('<link rel="stylesheet"', 'CSS'),
        ('<script src="/js/', 'JavaScript'),
        ('<form', 'Form')
    ]
    
    for check, name in checks:
        if check in html:
            print(f'✅ {name} found')
        else:
            print(f'⚠️  {name} not found')
            
except Exception as e:
    print(f'❌ Website test failed: {e}')

thread.join()
