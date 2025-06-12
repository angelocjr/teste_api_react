function Search() {
  return (
    <form class="form-comparacao">
      <div class="grupo-campos">
        <div class="campo">
          <label for="pais1">País 1:</label>
          <select id="pais1" name="pais1" required>
            <option value="">Selecione</option>
            <option value="br">Brasil</option>
            <option value="us">Estados Unidos</option>
            <option value="fr">França</option>
          </select>
	</div>
      </div>
    </form>
  );
}

export default Search;

