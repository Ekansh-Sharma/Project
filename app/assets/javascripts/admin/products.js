var product = function(){
  var addTags = function(event){
    let html = '<div><label>Tag Name</label><input type="text" name="product[tags][]"><a onclick="remove(this)" href="#">Remove</a><br/></div>'
    $("#tags").append(html);
    return event.preventDefault();
  }

  var addCategories = function(event) {
   let html = '<div><label>Category Name</label><input type="text" name="product[categories][]"><a onclick="remove(this)" href="#">Remove</a><br/></div>'
    $("#categories").append(html);
    return event.preventDefault();
  }
  return { addTags: addTags, addCategories: addCategories};
}();

