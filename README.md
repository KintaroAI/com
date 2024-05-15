# KintaroAI.com

## Local dev server
`./jekyll_dev_run.sh`

## Deploy
`./deploy.sh`


## Run Docker container
`./update-container.sh`

## Setup Webhook
Install [webhook](https://github.com/adnanh/webhook) on your server.

Example for Debian:
`sudo apt-get install webhook`.

Create hooks.json (see [webhook/hooks-template.json](webhook/hooks-template.json) as an example).

Run `webhook -hooks hooks.json -verbose` to test it.

Add location to Nginx like this:
```
    location /hooks/ {
        proxy_pass http://127.0.0.1:9000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
```
And restart Nginx: `sudo systemctl restart nginx`

Try it out:
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "X-Hub-Signature: REPLACE_THIS_TEST_SECRET" \
  -d '{"ref": "master"}' \
  https://your-server.com/hooks/deploy
```
