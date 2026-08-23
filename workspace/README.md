# © Mayanktaker Computers & Web Development | https://mayanktaker.com
# Mayanktaker Devbox Workspace Directory

Place your project files, repositories, or source code inside this folder (`workspace/`).

## Why is this safe?
- The Devbox container mounts ONLY this directory (`/workspace`).
- The agent has **no access** to your main host system root (`/`), `/home`, `/etc`, or personal documents.
- If an AI agent executes `rm -rf /`, it only deletes temporary files inside the isolated container!
