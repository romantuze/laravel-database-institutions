  //Источник финансирования
  window.onload = function() {

    //Источник финансирования
    function finances() {
      var finance_array = [];
      var finance_button = document.getElementById("finance-button");
      var finance_input = document.getElementById("finance-input");  
      var finance_select = document.getElementById("finance-select");  
      var finance_list = document.getElementById("finance-list");  
      if (finance_button) {
      finance_button.onclick = function() {  
        if (finance_select.value !== "") {
          if (finance_array.indexOf(finance_select.value) === -1) {
            finance_array.push(finance_select.value);
            finance_select.value="";
          }
          finance_input.value = finance_array.join(",");
          finance_list.innerText = "";
          for (var i = 0; i < finance_array.length; i++) {
            var new_li = document.createElement('li'); 
            new_li.innerHTML = finance_array[i];
            finance_list.appendChild(new_li);
          }
        }
        return false;
      }
      }
    }



   //kosgu
   function kosgu() {
    var kosgu_array = [];
    var new_kosgu = [];
    var kosgu_string = "";
    var kosgu_button = document.getElementById("kosgu-button");
    var kosgu_input = document.getElementById("kosgu-input");  
    var kosgu_select = document.getElementById("kosgu-select"); 
    var kosgu_amount = document.getElementById("kosgu-amount");
    var kosgu_list = document.getElementById("kosgu-list");  
    var unique = (value, index, self) =>{
          var findIndex = (element) => element[0] == value[0];
          return self.findIndex(findIndex) === index;
        }
    if (kosgu_button) {    
    kosgu_button.onclick = function() {  
      if ((kosgu_select.value !== "") && (kosgu_amount.value !== "")) {
        new_kosgu = [];
        new_kosgu.push(kosgu_select.value);
        new_kosgu.push(kosgu_amount.value);        
        kosgu_select.value = "";
        kosgu_amount.value = ""
        kosgu_array.push(new_kosgu);    
        kosgu_array = kosgu_array.filter(unique);
        kosgu_string = JSON.stringify(kosgu_array)
        kosgu_input.value = kosgu_string;     
        kosgu_list.innerText = "";
        for (var i = 0; i < kosgu_array.length; i++) {
          var new_li = document.createElement('li'); 
          new_li.innerHTML = kosgu_array[i][0] + " - " + kosgu_array[i][1] + " р";
          kosgu_list.appendChild(new_li);
        }  
      }
      return false;
    }
    }
  }


    finances();
    kosgu();

  }