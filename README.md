# ![Wallet Logo](app/assets/images/wallet-logo.png) Wallet

[![Depfu](https://badges.depfu.com/badges/e14f8a02ff6e4dd1d3b54689fd3cc5fe/overview.svg)](https://depfu.com/github/hieuk09/wallet)
[![Build Status](https://travis-ci.org/hieuk09/wallet.svg?branch=master)](https://travis-ci.org/hieuk09/wallet)
[![Maintainability](https://api.codeclimate.com/v1/badges/0b3fc614dbd5106f18da/maintainability)](https://codeclimate.com/github/hieuk09/wallet/maintainability)

This is my personal note of my finance

### Setup

- Create the database

```shell
rake db:create db:schema:load
rake db:seed
```

- Create a OpenExchangeRate account and get the app_id
- Create `secrets.yml` by copy the yaml data below, replace by real token

```yaml
development:
  secret_key_base: <some_key>
  open_exchange_rate_app_id: <some_key>
test:
  secret_key_base: <some_key>
```

- Start the server and start using:

```shell
rails server
```

- Now, the application can be used in [localhost:3000](http://localhost:3000).

### Credit

- Big thanks for [@zuuritaly](https://github.com/zuuritaly) to design
[the logo](https://github.com/hieuk09/wallet/issues/37#issuecomment-399676126) for this app.
