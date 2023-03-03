# recipe-app-api

Recipe API project from https://www.udemy.com/course/django-python-advanced course

## How we'll handle Linting

- Install `flake8` package
- Run it through Docker compose
- When there's no output it's because there are no issues to fix
- When there are errors, fix from the bottom up, since lines might change

## Testing

- Use Django test suite
- Setup tests per Django app
- Run tests through Docker Compose

## Github Actions

Is a automation tool that's similar to Travis-CI, Gitlab CI/CD, Jenkins
Has jobs that run when code changes, and can be used to automate tasks
Common uses include:

- Deployment
- Code linting
- Unit tests

### How it works

When a trigger happens, like "Push to Github", some job is ran, like "Run unit tests", and then we receive the result of it, if it successed or failed.

### Pricing

Charged per minute, but every free Github account has 2000 free minutes, although this is more than necessary and even if it's not there are various paid plans

## Django test framework

Based on the `unittest` library, but Django adds features to it, like:

- Test client - dummy web browser
- Simulate authentication
- Temporary database
- API test client
- Test database: every test we run will have a fresh DB by default, but it can be overwritten

## Testing

### Where to put tests?

You can use `tests.py` file or `tests/` directory (but not both)
Test modules must start with `test_`, and must contain `__init__.py`

### Test classes

- `SimpleTestCase`
  - No database integration
  - Useful if no database is required for your test
  - Save time executing tests
- `TestCase`
  - Database integration
  - Useful for testing code that uses the database

### Writing tests

- Import test class
  - `SimpleTestCase` - No database
  - `TestCase` - Has Database
- Import objects to test
- Define test class
- Add test method
- Setup inputs
- Execute code to be tested
- Check output

### TDD

1. Write test for behavior expected to see in code
2. Test fails
3. Write code so test passes

### Mocking

#### What is Mocking?

- Override or change behavior of dependencies
- Avoid unintended side effects (for instance unexpected results from things we are not testing)
- Isolate code being tested

#### Why use mocking?

- Speed up tests, since we are not executing every service
- Avoid relying on external services
  - Can't guarantee they will be available
  - Makes tests unpredictable and inconsistent
- Avoid unintended consequences

  - Accidentally sending emails
  - Overloading external services

  #### How to use mocking?

  - Use `unittest.mock`
    - `MagicMock/Mock` - Replace real objects
    - `path` - Override code for tests
