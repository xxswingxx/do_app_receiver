# README

Simple app that receives files and store them in tmp/uploads.

## Usage
Run this app and expose it using ngrok or localtunnel
```bash
$ ngrok http --subdomain=file-uploads --region=us 4567
```

On the source server run curl to send the file to the app:

```bash
# The app expects the file to be sent on the "data" parameter
$ curl -F 'data=@/home/app/database/backup.tar.gz.enc' https://file-uploads.ngrok.io/upload
```

Once finished, the file should be stored in the `tmp/upload` folder of the app

