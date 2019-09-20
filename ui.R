
shinyUI(
  bootstrapPage(
    useShinyjs(),
    
    textInput('randomField','Enter Text:'),
    actionButton("openChars","Add Symbols")
    #,actionButton('button_Д','Д')
    # textInput('chars','Enter Text:'),
    # tags$script('
    #     document.onmouseup = document.onkeyup = document.onselectionchange = function() {
    #     var selectedField = document.getElementById("chars");
    #     var myText = selectedField.value;
    #     var cursorPos = selectedField.selectionStart;
    #     Shiny.onInputChange("cursorPos", cursorPos);
    #     };
    # '),
    
    
    # # a normal action button.
    # actionButton("btn1","show alert"),
    # actionButton("btn10","Add characters"),
    # actionButton('hi', "Click here!"),
    # actionButton('hi2', "Click here2!")
    # 
    # # include css
    # includeCSS("www/style.css"),
    # includeHTML("www/filas.html"),
    # 
    # # include the message.js script so the JavaScript knows the custom message handler we have written
    # includeScript("www/message.js"),
    # 
    # div( id = "container", 
    #      
    #      # image of rstudio logo
    #      img(src = "RStudio-Ball.png", id = "RStudio"),
    #      
    #      # text output
    #      textOutput("text")
    # )
    
  )
)


# function Insert(letter) {
#     var myText = selectedField.value;
#     console.log("New selection made2"+myText);
#     var leftPos = selectedField.selectionStart;
#     console.log("New selection made2"+leftPos);
#     var range = document.selection.createRange();
#     var rightPos = selectedField.selectionEnd;
#     myText = myText.substring(0,leftPos) + letter + myText.substring(rightPos, myText.length);
#     selectedField.value = myText;
#     selectedField.setSelectionRange( leftPos+1, leftPos+1);
#     selectedField.focus();
#     return(myText)
# }



# tags$script('
#         
#         document.onmouseup = document.onkeyup = document.onselectionchange = function() {
#         var selectedField = document.getElementById("chars");
#           var myText = selectedField.value;
#         console.log("New selection made"+myText);
#         var leftPos = selectedField.selectionStart;
#         console.log("New selection made2"+leftPos);
#         var range = document.selection.createRange();
#         var rightPos = selectedField.selectionEnd;
#         myText = myText.substring(0,leftPos) + letter + myText.substring(rightPos, myText.length);
#         selectedField.value = myText;
#         selectedField.setSelectionRange( leftPos+1, leftPos+1);
#         selectedField.focus();
#         Shiny.onInputChange("mydata", selection);
#         };
#         '),