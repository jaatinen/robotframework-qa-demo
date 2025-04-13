# Robot Framework QA Demo

This is a short demo project illustrating how to work with key testing technologies using Robot Framework, React Testing Library, and additional tools. The goal is to showcase:

- REST API testing
- Frontend component testing
- Python unit tests
- Performance testing with JMeter
- GitHub Actions for continuous integration

## Technologies

- **Robot Framework** for automated tests
  - **RequestsLibrary** for API tests
  - **DatabaseLibrary** for database tests (if needed)
- **React Testing Library** and **Jest** for frontend unit tests
- **GitHub Actions** for CI workflows
- **JMeter** for performance testing

## Test Execution

### 1. API Tests (Robot Framework)

```bash
pip install -r requirements.txt
robot tests/api/reqres_user_tests.robot
```

### 2. Frontend Tests (React)

```bash
cd frontend-tests
npm install
npm test
```

### 3. Python Unit Tests

```bash
cd python-tests
pytest
```

### 4. JMeter Performance Tests

```bash
cd robotframework-qa-demo
jmeter -n -t tests/performance/reqres_api_test.jmx -l results.jtl -e -o tests/performance/html-report
```

## Tested Targets

### API (reqres.in)
- GET /users
- POST /users

### Frontend Component
A React component that renders a greeting for a given name.

### CI Workflows

The project includes GitHub Actions workflows that run:
- **API Tests**
- **React unit tests**
- **Python Unit Tests**
- **JMeter Performance Tests**

Each step is triggered on push or pull request, ensuring consistent automated verification.

## Purpose

This repository simulates a practical scenario where multiple aspects of an application are tested:

- **REST APIs** with Robot Framework RequestsLibrary
- **Frontend components** with React Testing Library
- **Python scripts** with pytest
- **Performance** with JMeter
- **Continuous Integration** with GitHub Actions

All tests are structured to demonstrate best practices in separating test types and running them automatically in CI.