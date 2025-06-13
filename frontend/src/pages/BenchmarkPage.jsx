import { useState } from 'react';
import Header from '../components/Header';
import Search from '../components/Search';
import SelectCountry from '../components/SelectCountry';
import SelectPeriod from '../components/SelectPeriod';
import ViewBenchmarks from '../components/ViewBenchmarks';
import ViewResults from '../components/ViewResults';
import './BenchmarkPage.css';

function BenchmarkPage() {
  const [search, setSearch] = useState('');
  const [country, setCountry] = useState({ country1: '', country2: '' });
  const [period, setPeriod] = useState({ start: '', end: '' });

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!country.country1 || !country.country2 || !period.start || !period.end) {
      alert("Preencha todos os campos.");
      return;
    }

    try {
      const fetchCountryData = async (countrySlug) => {
        const res = await fetch(`https://disease.sh/v3/covid-19/historical/${countrySlug}?lastdays=all`);
        const json = await res.json();

        if (json.message) throw new Error(json.message);

        const filterTimeline = (timeline) => {
          const filtered = {};
          const startDate = new Date(period.start);
          const endDate = new Date(period.end);

          for (const [date, value] of Object.entries(timeline)) {
            const [month, day, year] = date.split('/');
            const fullYear = 2000 + parseInt(year, 10); 
            const formattedDate = new Date(fullYear, month - 1, day);

            if (formattedDate >= startDate && formattedDate <= endDate) {
              filtered[date] = value;
            }
          }
          return filtered;
        };

        return {
          country: json.country,
          cases: filterTimeline(json.timeline.cases),
          deaths: filterTimeline(json.timeline.deaths),
          recovered: filterTimeline(json.timeline.recovered),
        };
      };

      const data1 = await fetchCountryData(country.country1);
      const data2 = await fetchCountryData(country.country2);

      console.log('data1', data1);
      console.log('data2', data2);

      const benchmarkId = 1;

      await fetch(`/api/benchmarks`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          country1: country.country1,
          country2: country.country2,
          start_date: period.start,
          end_date: period.end,
          covid_data_1: data1,
          covid_data_2: data2,
        }),
      });

      alert('Dados enviados com sucesso!');
    } catch (error) {
      console.error('Erro ao buscar ou enviar dados:', error);
      alert('Erro ao buscar dados da API ou enviar ao backend.');
    }
  };

  return (
    <div className='page-container'>
      <Header />
      <form onSubmit={handleSubmit} className='custom-form'>
        <SelectCountry country={country} setCountry={setCountry} />
        <SelectPeriod period={period} setPeriod={setPeriod} />
        <div className='page-button'>
          <button type='submit'>Salvar 💾</button>
        </div>
      </form>
      {/* <Search search={search} setSearch={setSearch} /> */}
      <ViewBenchmarks country={country} period={period} search={search} />
	  {/*<ViewResults country={country} period={period} search={search} />*/}
    </div>
  );
}

export default BenchmarkPage;
