import { useState, useEffect } from 'react';
import Header from '../components/Header';
import Search from '../components/Search';
import SelectCountry from '../components/SelectCountry';
import SelectPeriod from '../components/SelectPeriod';
import ViewBenchmarks from '../components/ViewBenchmarks';
import ViewResults from '../components/ViewResults';
import './BenchmarkPage.css';

function BenchmarkPage() {
  const [search, setSearch] = useState('');
  const [country, setCountry] = useState('');
  const [period, setPeriod] = useState({ start: '', end: '' });

  return (
    <div className='page-container'>
      <Header />
      <SelectCountry country={country} setCountry={setCountry} />
      <SelectPeriod period={period} setPeriod={setPeriod} />
      <Search search={search} setSearch={setSearch} />
      <ViewBenchmarks country={country} period={period} search={search} />
      <ViewResults country={country} period={period} search={search} />
    </div>
  );
}

export default BenchmarkPage;
