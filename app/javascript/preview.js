if(window.location.href.match(/\/items\/new/) || window.location.href.match(/\/items\/\d+\/edit/)){
  document.addEventListener('DOMContentLoaded', function(){

    const ImageList = document.getElementById("image-list");

    document.getElementById("item_image").addEventListener("change", function(e){
      const imageContent = document.getElementById("current-image");
      const addImage = document.getElementById("add-image");
      if (imageContent){
        imageContent.remove();
      } else if (addImage){
        addImage.remove();
      }
      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      const imageElement = document.createElement("div");
      const blobImage= document.createElement("img");
      blobImage.setAttribute("src", imageURL);
      blobImage.setAttribute("id", "add-image")
      
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
};