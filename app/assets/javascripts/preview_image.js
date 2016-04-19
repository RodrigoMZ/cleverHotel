function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
        var img = $("#image_upload_preview");
        if (img) {
          img.attr("style", "height:100px;width: 100px");
          img.attr("src", e.target.result);
          //dvPreview.append(img);
        }
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function multi_images_preview(){
  if(window.File && window.FileList && window.FileReader)
  {
      var filesInput = document.getElementById("hotel_picture");
      if (filesInput) {
        filesInput.addEventListener("change", function(event){

            var files = event.target.files; //FileList object
            var output = document.getElementById("result");

            for(var i = 0; i< files.length; i++)
            {
                var file = files[i];

                //Only pics
                if(!file.type.match('image'))
                  continue;

                var picReader = new FileReader();

                picReader.addEventListener("load",function(event){

                    var picFile = event.target;

                    var div = document.createElement("div");

                    div.className = 'inline';

                    div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "' style='height:100px;width:100px;'/> <a href='#_' class='remove_pict'>x</a>";

                    output.insertBefore(div,null);
                    div.children[1].addEventListener("click", function(event){
                       div.parentNode.removeChild(div);
                    });

                });

                 //Read the image
                picReader.readAsDataURL(file);
            }

        });
      }
  }
  else
  {
      console.log("Your browser does not support File API");
  }
}
