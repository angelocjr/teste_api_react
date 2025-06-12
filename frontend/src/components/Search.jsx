import '../components/Search.css';

function Search() {
  return (
      <div className="grupo-campos">
        <div className="campo">
          <label htmlFor="pais1">Procurar</label>
	  <input type="text" placeholder="Digite aqui..." />
	</div>
      </div>
  );
}

export default Search;

