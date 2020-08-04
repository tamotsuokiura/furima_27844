$(function(){
  $(".price-input").on("keyup",function(){
    let inputPrice = $(".price-input").val();
    let taxPrice = Math.round(inputPrice*0.1)
    console.log(taxPrice)
    $("#add-tax-price").html(taxPrice);
    $("#profit").html(inputPrice - taxPrice);
  });
});