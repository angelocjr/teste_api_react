import { useEffect, useState } from 'react';
import '../components/ViewBenchmarks.css';
import ViewResults from './ViewResults';

function ViewBenchmarks() {
  const [benchmarks, setBenchmarks] = useState([]);
  const [selectedResults, setSelectedResults] = useState([]);
  const [selectedBenchmark, setSelectedBenchmark] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/api/benchmarks')
      .then((res) => res.json())
      .then((data) => {
        console.log('Benchmarks recebidos:', data);
        setBenchmarks(data.data);
      })
      .catch((err) => console.error('Erro ao buscar benchmarks:', err));
  }, []);

  const handleViewClick = async (benchmarkId) => {
    try {
      const res = await fetch(`http://localhost:3000/api/benchmarks/${benchmarkId}/results`);
      if (!res.ok) throw new Error("Erro ao buscar resultados");
      const json = await res.json();

      setSelectedResults(json.data);
      console.log(json.data);
      setSelectedBenchmark(benchmarks.find(b => b.id === benchmarkId));
    } catch (error) {
      console.error(error);
      alert("Falha ao carregar resultados.");
    }
  };

  const handleDeleteClick = async (benchmarkId) => {
    if (!window.confirm('Tem certeza que deseja excluir este benchmark?')) return;
    console.log('resultado debug', benchmarkId)
    try {
      const res = await fetch(`http://localhost:3000/api/benchmarks/${benchmarkId}`, {
        method: 'DELETE',
      });
      if (!res.ok) throw new Error('Erro ao excluir benchmark');

    // Atualiza a lista removendo o excluído
      setBenchmarks(benchmarks.filter(b => b.id !== benchmarkId));
    } catch (error) {
      console.error(error);
      alert('Falha ao excluir benchmark.');
    }
  };


  return (
    <div className="tabela-wrapper">
      <h2>Benchmarks</h2>
      <table className="tabela">
        <thead>
          <tr>
            <th>Nome</th>
            <th>Ver</th>
            <th>Excluir</th>
            <th>Criado</th>
            <th>Atualizado</th>
          </tr>
        </thead>
        <tbody>
          {benchmarks.map((item) => (
            <tr key={item.id}>
              <td>{item.attributes.name_benchmark}</td>
              <td><button onClick={() => handleViewClick(item.id)}>👁️</button></td>
              <td><button onClick={() => handleDeleteClick(item.id)}>❌</button></td>
              <td>{new Date(item.attributes.created_at).toLocaleDateString()}</td>
              <td>{new Date(item.attributes.updated_at).toLocaleDateString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
       {selectedResults.length > 0 && (
        <ViewResults results={selectedResults} />
      )}
    </div>
  );
}

export default ViewBenchmarks;
