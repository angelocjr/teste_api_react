import '../components/ViewResults.css';

function ViewResults() {
  return (
    <div className='text-center'>
    <h1>Periodo colocar a data</h1>
    <div className="tabela-wrapper-r">
      <div>
        <h2>Results 1</h2>
        <table className="tabela">
          <thead>
            <tr>
              <th>Nome</th>
              <th>País 1</th>
              <th>País 2</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Comparação COVID</td>
              <td>Brasil</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div>
        <h2>Results 2</h2>
        <table className="tabela">
          <thead>
            <tr>
              <th>Nome</th>
              <th>Casos</th>
              <th>Casos Fatais</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Comparação COVID</td>
              <td>Brasil</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    </div>
  );
}

export default ViewResults;
