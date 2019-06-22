<h1 align="center">Welcome to check-services 👋</h1>
<p>
  <a href="https://twitter.com/jinjie">
    <img alt="Twitter: jinjie" src="https://img.shields.io/twitter/follow/jinjie.svg?style=social" target="_blank" />
  </a>
</p>

> Simple bash script to check for services that is not active and attempts to start it.

Inspired from http://www.akamaras.com/linux/linux-script-to-check-if-a-service-is-running-and-start-it-if-its-stopped/

## Install

```sh
cd my-script-directory/
curl https://raw.githubusercontent.com/jinjie/check-services/master/check-services.sh -o check-services.sh
chmod +x check-services.sh
```

## Usage

- Edit check `check-services.sh` and use your own configuration.
- Add cron to run script periodically. Make sure the user running the cron have permission to start services.

```cron
# Cron example

MAILTO=""
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin

* * * * * root /root/check-services/check-services.sh
```

## Author

👤 **Kong Jin Jie**

* Website: [Swift DevLabs](https://www.swiftdev.sg/)
* Twitter: [@jinjie](https://twitter.com/jinjie)
* Github: [@jinjie](https://github.com/jinjie)

## 🤝 Contributing

This is a quick fix for making sure of the services is running on my server. Do feel free to improve.

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/jinjie/check-services/issues).

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_