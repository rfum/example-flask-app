
#  Example Flask Application

  

A simple web-application built with Flask backed by Gunicorn(systemd). It only has one purpose: Saying Hello!.

  

It's also simple to make this application up and run on your laptop...

Just clone it into your local and ```vagrant up``` ! That's all.

  

From now on, if your VM is up and run then just curl to it to see what happens ;

```$ curl http://127.0.0.1:8080```

  

Let's say you've changed a little bit on the application. This smart vagrant box immediataly finds out this. To see this behaviour try ;

  

$ ```while [ 1 ] ; do curl http://127.0.0.1:8080; echo "\n"; sleep 1; done ```

  

If you want to change the code base to a different github repository (ofc. a public one ) just chekcout the Vagrantfile. I've added two env. variables to determine code base.(```GITHUB_USERNAME and GITHUB_REPONAME```). With editing these two you can change the codebase as you wish.

  

If you want more details on, how everything works. Just peek into the source code. The comments must have been laying around.

  

You may wonder, "why not crontab?". Because with systemd services, I have lesser time interval than 1 minute.

  

Aand of course you can checkout how this thing evolved.

  

The nasty way to do is :

```git show ```

More cleaner way is GitHub UI.