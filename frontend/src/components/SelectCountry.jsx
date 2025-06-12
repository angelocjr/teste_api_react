import { useState, useEffect } from 'react';
import '../components/SelectCountry.css';

function SelectCountry({ country, setCountry }) {
  const [countries, setCountries] = useState([]);

  useEffect(() => {
    fetch('https://restcountries.com/v3.1/all?fields=cca2,name')
      .then(res => res.json())
      .then(data => {
        const sorted = data
          .map(c => ({
            code: c.cca2,
            name: c.name.common,
            slug: c.name.common.toLowerCase().replace(/\s+/g, '-')
          }))
          .sort((a, b) => a.name.localeCompare(b.name));
        setCountries(sorted);
      })
      .catch(err => console.error(err));
  }, []);

  return (
    <div className='container-country'>
      <div className='selector'>
        <label htmlFor='country1'>Selecionar País A</label>
        <select
          id='country1'
          name="country1"
          value={country.country1 || ''}
          onChange={(e) =>
            setCountry({ ...country, country1: e.target.value })
          }
        >
          <option value="">Selecione</option>
          {countries.map(c => (
            <option key={c.code} value={c.slug}>{c.name}</option>
          ))}
        </select>
      </div>

      <div className='selector'>
        <label htmlFor='country2'>Selecionar País B</label>
        <select
          id='country2'
          name="country2"
          value={country.country2 || ''}
          onChange={(e) =>
            setCountry({ ...country, country2: e.target.value })
          }
        >
          <option value="">Selecione</option>
          {countries.map(c => (
            <option key={c.code} value={c.slug}>{c.name}</option>
          ))}
        </select>
      </div>
    </div>
  );
}

export default SelectCountry;
