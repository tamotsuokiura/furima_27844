$(function(){
  $(".price-input").on("keyup",function(){
    let inputPrice = $(".price-input").val();
    let taxPrice = Math.round(inputPrice*0.1)
    $("#add-tax-price").html(taxPrice);
    $("#profit").html(inputPrice - taxPrice);
  });
});