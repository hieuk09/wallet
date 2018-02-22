## Wallet

[![Depfu](https://badges.depfu.com/badges/e14f8a02ff6e4dd1d3b54689fd3cc5fe/overview.svg)](https://depfu.com/github/hieuk09/wallet)

This is my personal note of my finance

### Setup

- Create the database

```shell
rake db:create db:schema:load
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

- Start the server and start using!
