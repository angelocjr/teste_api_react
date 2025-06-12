function SelectPeriod() {
  return (
    <div class="comparacao-datas">
      <div class="campo-data">
        <label for="data-inicial">Data Inicial:</label>
        <input type="date" id="data-inicial" name="data-inicial"/>
      </div>

      <div class="campo-data">
        <label for="data-final">Data Final:</label>
        <input type="date" id="data-final" name="data-final"/>
      </div>
    </div>
  );
}

export default SelectPeriod;
