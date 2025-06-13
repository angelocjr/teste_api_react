import '../components/ViewResults.css';

function ViewResults({ results }) {
  if (!results || results.length === 0) return <p className='text-center'>Nenhum resultado disponível.</p>;

  return (
    <div className='text-center'>
      <div className="tabela-wrapper-r">
        <div>
          <h2>{results && results.length > 0 && results[0].attributes.country1}</h2>
          <table className="tabela">
            <thead>
              <tr>
                <th>#</th>
                <th>País 1</th>
                <th>Casos</th>
                <th>Recuperados</th>
                <th>Óbitos</th>
	        <th>Periodo</th>
              </tr>
            </thead>
            <tbody>
              {results.map((result, index) => (
                <tr key={result.id}>
                  <td>{index + 1}</td>
                  <td>{result.attributes.country1}</td>
                  <td>{result.attributes.total_cases1}</td>
                  <td>{result.attributes.total_recovered1}</td>
                  <td>{result.attributes.total_deaths1}</td>
		  <td>{result.attributes.name_result}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div>
          <h2>{results && results.length > 0 && results[0].attributes.country2}</h2>
          <table className="tabela">
            <thead>
              <tr>
                <th>#</th>
                <th>País 2</th>
                <th>Casos</th>
                <th>Recuperados</th>
                <th>Óbitos</th>
	  	<th>Periodo</th>
              </tr>
            </thead>
            <tbody>
              {results.map((result, index) => (
                <tr key={result.id}>
                  <td>{index + 1}</td>
                  <td>{result.attributes.country2}</td>
                  <td>{result.attributes.total_cases2}</td>
                  <td>{result.attributes.total_recovered2}</td>
                  <td>{result.attributes.total_deaths2}</td>
		  <td>{result.attributes.name_result}</td>
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

