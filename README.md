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
