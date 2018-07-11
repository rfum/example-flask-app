
#  Example Flask Application

A simple web-application built with Flask, backed by Gunicorn and systemd. It only serves to a purpose: Saying Hello!

###  Dependencies:
  

- VirtualBox's latest version

- Vagrant's latest version

- A loopback adapter(localhost)

- Curl HTTP client(Optional)

- Bash(Optional)

Starting the application is simple. Just execute these two commands:

-  `$ git clone https://github.com/rfum/example-flask-app`

-  `$ vagrant up`
 

To make sure that the VM is configured as it has to be,make an HTTP request with curl :

-  ```$ curl http://127.0.0.1:8080```  

If you change the content of hello function in hello.py, then the VM automatically synchronizes itself with that change in a few seconds. If you want to see that change in the application, then execute the following :

-  ```$ while [ 1 ] ; do curl http://127.0.0.1:8080; echo "\n"; sleep 1; done``` 

This will immediately stdout the incoming responses. After seeing the change you can just press `CTRL+C` key combinations.  

If you are planning to change the code base to a different GitHub repository, ( Be sure it's public )
then just check the Vagrantfile. I've added two environment variables to determine codebase (```GITHUB_USERNAME``` and ```GITHUB_REPONAME```). With editing these two environment variables, you can change the codebase as your demand.

If you want more details on "how everything works?". Just peek into the source code. You'll find related comment lines in each file.

You may wonder, "why not crontab and systemd?". Because with systemd , we have lesser time interval than 1 minute(refer: "https://crontab.guru/#\*\_\*\_\*\_\*\_\*" ).

And of course you may want to see "how this project evolved?".

From terminal execute the below :

-  ```git show ```

But this one is not much eye friendly.More cleaner way to do is, using GitHub UI or a git client such as GitKraken and SourceTree.