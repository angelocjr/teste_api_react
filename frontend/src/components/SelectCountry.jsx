function SelectCountry() {
  return (
    <div className='container-country'>
      <div className='selector'>
        <label for='country1'>Selecionar Pais A</label>
	<select id='country1' name="pais1">
	  <option value="">Selecione</option>
	</select>
      </div>
      <div className='selector'>
        <label for='country2'>Selecionar Pais B</label>
	<select id='country2' name="country2">
	  <option value="">Selecione</option>
        </select>
      </div>
    </div>
  );
}

export default SelectCountry;
