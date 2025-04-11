import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

// Määritellään yksittäinen testi
test('renders greeting with name', () => {
  render(<MyComponent name="Jaatinen" />);
  // Haetaan ruudulta elementti, joka sisältää oikean tekstin
  const element = screen.getByText(/Hello, Jaatinen!/i);
  // Varmistetaan, että elementti todella löytyy DOMista
  expect(element).toBeInTheDocument();
});
