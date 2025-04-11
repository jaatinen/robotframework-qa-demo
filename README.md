# Robot Framework QA Demo

Lyhyt demo pyrkii kuvaamaan osaamista muutaman avainteknologian osalta käyttämällä Robot Frameworkia ja esimerkiksi React Testing Libraryä.

## Teknologiat

- Robot Framework
  - RequestsLibrary (API-testit)
- React Testing Library + Jest (frontend-yksikkötesti)
- GitHub Actions (CI)

## Testien suorittaminen

### 1. API-testit (Robot Framework)

```bash
pip install -r requirements.txt
robot tests/api/reqres_user_tests.robot
```

### 2. Frontend-testit (React)

```bash
cd frontend-tests
npm install
npm test
```

## Testattavat kohteet

### API: [reqres.in](https://reqres.in)

- GET /users
- POST /users

### Frontend-komponentti

React-komponentti joka renderöi tervehdyksen annetulle nimelle.

## Tavoite

Projekti simuloi käytännön tilannetta, jossa testataan:

- REST-rajapintoja
- Frontend-komponentteja
- Käytetään hyviä käytäntöjä, kuten eriytetty rakenne ja CI-testit