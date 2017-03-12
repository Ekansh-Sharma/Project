var product = function(){
  var addTags = function(event){
    let html = '<div><label>Tag Name</label><input type="text" name="product[tags][]" class ="validateTags"><a onclick="remove(this)" href="#">Remove</a><br/></div>'
    $("#tags").append(html);
    return event.preventDefault();
  }

  var addCategories = function(event) {
   let html = '<div><label>Category Name</label><input type="text" name="product[categories][]" class ="validateCategories"><a onclick="remove(this)" href="#">Remove</a><br/></div>'
    $("#categories").append(html);
    return event.preventDefault();
  }

  var formValidate = function(event){
    var flag = true;
    $(".validateCategories").filter(function() {
      if(checkEmpty(this, 'Category')){
        flag = false;
        return false;
      }
    });
    if(flag){
      $(".validateTags").filter(function() {
        if(checkEmpty(this, 'Tag')){
          flag = false;
          return false;
        }
      });
    };
    return flag;
  }

  var checkEmpty = function(that, name){
    if($(that).val() == ""){
        alert(name + ' is Empty');
        return true;
    }
    return false;
  }
  return { addTags: addTags, addCategories: addCategories, formValidate: formValidate};
}();

