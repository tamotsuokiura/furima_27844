if(window.location.href.match(/\/items\/new/) || window.location.href.match(/\/items\/\d+\/edit/)){
  document.addEventListener('DOMContentLoaded', function(){

    const ImageList = document.getElementById("image-list");

    document.getElementById("item_image").addEventListener("change", function(e){
      const imageContent = document.querySelector("img");
      if (imageContent){
        imageContent.remove();
      };

      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      const imageElement = document.createElement("div");
      const blobImage= document.createElement("img");
      blobImage.setAttribute("src", imageURL);
      
      imageElement.appendChild(blobImage);
      console.log(ImageList);
      ImageList.appendChild(imageElement);
    });
  });
};