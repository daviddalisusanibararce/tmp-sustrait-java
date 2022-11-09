# CI CD






## Generate GPG credentials:

```shell
$ gpg --full-gen-key
$ gpg --list-keys
$ gpg --keyserver keyserver.ubuntu.com --send-keys 193EAE47



```

##


Branches configuration:

```json
  "branches": [
    // maintenances (also generate release)
    { "name": "+([0-9])?(.{+([0-9]),x}).x" },
    // release
    { "name": "main" },
    { "name": "next" },
    { "name": "next-major" },
    // pre-release
    { "name": "beta", "prerelease": true },
    { "name": "alpha", "prerelease": true }
  ],
```
