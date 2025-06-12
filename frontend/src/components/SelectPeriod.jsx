import { useState } from 'react';
import '../components/SelectPeriod.css';

function SelectPeriod({ period, setPeriod }) {
  const handleChange = (e) => {
    const { name, value } = e.target;
    setPeriod(prev => ({ ...prev, [name]: value }));
  };

  return (
    <div className="comparacao-datas">
      <div className="campo-data">
        <label htmlFor="data-inicial">Data Inicial:</label>
        <input
          type="date"
          id="data-inicial"
          name="start"           // o nome deve bater com a chave em period
          value={period.start}
          onChange={handleChange}
        />
      </div>

      <div className="campo-data">
        <label htmlFor="data-final">Data Final:</label>
        <input
          type="date"
          id="data-final"
          name="end"             // o nome deve bater com a chave em period
          value={period.end}
          onChange={handleChange}
        />
      </div>
    </div>
  );
}

export default SelectPeriod;
