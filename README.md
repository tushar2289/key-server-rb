# KEY SERVER RB

This is a onboarding project. The problem statement of the project can be found at [problem_statement.txt](https://github.com/tushar2289/key-server-rb/blob/master/problem_statement.txt)

## Steps for installation

1. Install **rvm**
   [`https://rvm.io/rvm/install#basic-install`](https://rvm.io/rvm/install#basic-install)
   Choose the option - _Install RVM stable with ruby_

2. Bundle install gems

   ```
   bundle install
   ```

3. Running the webserver

   ```
   rackup
   ```

4. Opening homepage
   [`http://localhost:9292/`](http://localhost:4567/)
   Open above link on browser

## API logic

E1 => `/generate-key`
This API will generate the key and set the `created_on` time to be now. The same key is then added to `unblocked_keys`

E2 => `/get-available-key`
This API will get the first key from the list of `unblocked_keys`. The key will be blocked and will be moved from the `unblocked_keys` list to `blocked_keys` list.

E3 => `/unblock-key/:key`
This API will unblock the key sent in the `:key` parameter and if not found will return 404.

E4 => `/delete-key/:key`
This API will unblock the key sent in the `:key` parameter and if not found will return 404.

E5 => `/keep-alive/:key`
This API will unblock the key sent in the `:key` parameter and if not found will return 404.

To unblock all blocked keys, run the below command:

```
rake unblock_all_blocked_keys
```

To delete all unused keys, run the below command:

```
rake delete_unused_keys
```

Postman APIs can be imported from the collection inside the `postman` directory

## TESTS

Run the below command to run all the test cases

```
rspec
```

or

```
rake
```

## CRON START

```
whenever --update-crontab API-KEYS
```

## CRON STOP

```
whenever -c API-KEYS
```

## Commit rules

Follow [gitmoji](https://github.com/carloscuesta/gitmoji) style and rules
