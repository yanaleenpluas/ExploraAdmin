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

Now you can visit the application at https://localhost:3000/admin.

You'll need to create an admin user to be able to log in.
You can do this by running the following commands:

```
./bin/rails c
irb(main):001> AdminUser.create(email: "admin@example.com", password: "password")
```
