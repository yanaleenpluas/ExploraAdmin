# Explora Admin

An administration page for the Explora LMS project.

## Contributing

First, clone this repository:

```bash
git clone https://github.com/aloussase/ExploraAdmin.git
```

Then run the following in the repository's directory:

```bash
bundle install
./bin/rails db:migrate
```

After the setup, you can proceed to run the application:

```bash
./bin/rails serve
```

Now you can visit the application at http://localhost:3000/admin.

You'll need to create an admin user to be able to log in.

You can do this by visiting http://localhost:3000/register or through the
rails console like this:

```
./bin/rails c
irb(main):001> AdminUser.create(name: "John", last_name: "Doe", email: "admin@example.com", password: "password")
```

## Making Requests to the Canvas API

To make requests to the canvas API we use the
[Excon](https://github.com/excon/excon) gem. You need to create a file
`config/initializers/canvas.rb` with the following contents:

```ruby
Rails.application.config.canvas_api_key = "..."
Rails.application.config.canvas_api_base = "..."
```

Replace with the appropriate values. **DO NOT** push this file to the git repo.

Then you can access these variables from your controller with `$access_token`
and `$api_base`.
