import '../components/ViewBenchmarks.css';

function ViewBenchmarks() {
  return (
    <div className="tabela-wrapper">
    <h2>Benchmarks</h2>
    <table className="tabela">
      <thead>
        <tr>
          <th>Nome</th>
          <th>ver</th>
          <th>editar</th>
	  <th>excluir</th>
          <th>Criado</th>
          <th>Atualizado</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>benchmarname</td>
          <td>👁️ </td>
          <td>✏️</td>
          <td>❌</td>
          <td>2020-03-01</td>
          <td>2020-06-01</td>
        </tr>
      </tbody>
    </table>
    </div>
  );
}

export default ViewBenchmarks;

