function ViewResults() {
  return (
    <div class="tabela-wrapper">
    <h2>Results</h2>
    <table class="tabela">
      <thead>
        <tr>
          <th>ID</th>
          <th>Nome</th>
          <th>País 1</th>
          <th>País 2</th>
          <th>Data Inicial</th>
          <th>Data Final</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Comparação COVID</td>
          <td>Brasil</td>
          <td>Estados Unidos</td>
          <td>2020-03-01</td>
          <td>2020-06-01</td>
        </tr>
      </tbody>
    </table>
    </div>
  );
}

export default ViewResults;
