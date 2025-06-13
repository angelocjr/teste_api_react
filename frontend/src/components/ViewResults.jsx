import '../components/ViewResults.css';

function ViewResults({ results }) {
  if (!results || results.length === 0) return <p className='text-center'>Nenhum resultado disponível.</p>;

  return (
    <div className='text-center'>
      <h1>Resultados para o Benchmark</h1>
      <div className="tabela-wrapper-r">
        <div>
          <h2>Results 1</h2>
          <table className="tabela">
            <thead>
              <tr>
                <th>#</th>
                <th>País 1</th>
                <th>Casos</th>
                <th>Recuperados</th>
                <th>Óbitos</th>
              </tr>
            </thead>
            <tbody>
              {results.map((result, index) => (
                <tr key={result.id}>
                  <td>{index + 1}</td>
                  <td>{result.attributes.country_1}</td>
                  <td>{result.attributes.cases_1}</td>
                  <td>{result.attributes.recovered_1}</td>
                  <td>{result.attributes.deaths_1}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div>
          <h2>Results 2</h2>
          <table className="tabela">
            <thead>
              <tr>
                <th>#</th>
                <th>País 2</th>
                <th>Casos</th>
                <th>Recuperados</th>
                <th>Óbitos</th>
              </tr>
            </thead>
            <tbody>
              {results.map((result, index) => (
                <tr key={result.id}>
                  <td>{index + 1}</td>
                  <td>{result.attributes.country_2}</td>
                  <td>{result.attributes.cases_2}</td>
                  <td>{result.attributes.recovered_2}</td>
                  <td>{result.attributes.deaths_2}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default ViewResults;

