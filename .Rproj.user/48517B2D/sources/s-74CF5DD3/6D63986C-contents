shinyServer(function(input,output,session){
  showLog()
    
    
    characters_hebrew = c('ט','ח','ז','ו','ה','ד')
    characters_cyrillic = c('Б','В','Г','Д','Е','Ё')
    characters_kanji = c("藤","沖","椿","鮎","咲")
    allChars <- c(characters_cyrillic,characters_hebrew,characters_kanji)
    allChars_num <- as.character(1:length(allChars))
    
    selectedCharGroup <- reactiveValues(group=NULL,chars=NULL)
    cursor <- reactiveValues(position=0)
    
    observeEvent(input$openChars,{
        fieldValue <- input$randomField
        showModal( modalDialog(
            textInput('chars','Enter Text:',value = fieldValue),
            div(id='utfCharsDiv',
                selectInput('utfCharsSelect', 'Select group:', choices=c("",'cyrillic','hebrew'), selected = "", multiple = FALSE)
                ),
            tags$head(tags$script('
                update = document.onmouseup = document.onkeyup = document.onselectionchange = function(x) {
                //if (typeof x =="numeric"){
                //    var selectedField = document.getElementById("chars");
                //    var cursorPos = x;
                //    selectedField.setSelectionRange(cursorPos, cursorPos);
                //} else {
                    var selectedField = document.getElementById("chars");
                    var myText = selectedField.value;
                    var cursorPos = selectedField.selectionStart;
                    console.log("afterPassed"+selectedField.selectionStart );
                    
                //}
                //console.log( cursorPos );
                Shiny.onInputChange("cursorPos", cursorPos);
                //console.log( "vienas"+cursorPos );
                };
                Shiny.addCustomMessageHandler("focusHandler", focus );
                function focus(message){
                    var selectedField = document.getElementById("chars");
                    var pos = message+1;
                   // console.log(typeof pos)
                    console.log("before"+selectedField.selectionStart)
                    selectedField.focus();
                    selectedField.setSelectionRange(pos, pos);
                    console.log("after"+selectedField.selectionStart );
                    //document.getElementById("chars");
                    //console.log( "du"+pos );
                    //update(x=2);
                    //selectedField.focus();
                    //document.getElementById("chars").setSelectionRange( message+1, message+1);
                    //document.getElementById("chars").selectionStart = message+1;
                    //var cursorPos = message+1;
                    //Shiny.onInputChange("cursorPos", cursorPos);
                };
            '))
            ,footer = tagList(
                modalButton("Cancel"),
                actionButton("ok", "OK")
            )
        ))
    })  
    
    
    
    observeEvent(input$utfCharsSelect,{
        characters_cyrillic = c('Б','В','Г','Д','Е','Ё')
        characters_hebrew = c('ט','ח','ז','ו','ה','ד')
        characters_kanji = c("藤","沖","椿","鮎","咲")
        allChars <- c(characters_cyrillic,characters_hebrew,characters_kanji)
        allChars_num <- as.character(1:length(allChars))
        
        currentGroup <- selectedCharGroup$group
        newGroup <- input$utfCharsSelect
        selectedCharGroup$group <- newGroup
        currentChars <- NULL
        
        if (!is.null(currentGroup)){
            if (currentGroup=='cyrillic'){
                currentChars<- characters_cyrillic
            } else if (currentGroup=='hebrew'){
                currentChars<- characters_hebrew
            }
        } 
        
        if (newGroup=='cyrillic'){
            newChars<- characters_cyrillic
        } else if (newGroup=='hebrew'){
            newChars<- characters_hebrew
        } else {
            newChars <- NULL
        }
        selectedCharGroup$chars <- newChars
        
        if (!is.null(currentChars)){
            for (char in currentChars){
                char_num <- allChars_num[which(allChars==char)]
                removeUI(
                    selector = paste0('#',char_num)
                )
            }
        }
        if (!is.null(newChars)){
            for (char in newChars){
                char_num <- allChars_num[which(allChars==char)]
                insertUI(selector = '#utfCharsDiv', 
                         where =  "afterEnd", 
                         ui = actionButton(char_num,char))
            }
        }
        
    })
    
    
    # observeEvent(input$cursorPos,{
    #     cursor$position <- input$cursorPos
    #     cat(input$cursorPos)
    # })
   
    lapply(
        X = 1:length(allChars_num),
        FUN = function(i){
            letter_idx <- allChars_num[i]
            observeEvent(input[[letter_idx]], {
                idx <- as.numeric(letter_idx)
                add_letter <- allChars[idx]
                where <- input$cursorPos#cursor$position
                #cat('before:',cursor$position)
                fieldValue <- input$chars
                fieldValue <- unlist(strsplit(fieldValue,split=""))
                left_word <- fieldValue[0:where]
                if (length(left_word)==0) left_word <- ""
                if (where+1 >length(fieldValue)){
                    right_word <- ""
                } else {
                    right_word <- fieldValue[(where+1):length(fieldValue)]
                }
                if (length(right_word)==0) right_word <- ""
                fieldValue <- paste(c(left_word,add_letter,right_word),collapse="")
                #cursor$position <- where+1
                #cat('after:',cursor$position)
                #cat('three',where)
                updateTextInput(session,'chars','Enter Text:',value = fieldValue)
                message <- where
                #cursor$position <- where+1
                
                session$sendCustomMessage("focusHandler", message)

            })
        }
    )

    
    
    
    # ids <- allChars
    # for (id in ids) {
    #     local({
    #         my_id <- id
    #         shinyjs::onclick(my_id, {
    #             cat(my_id,'| ')
    #             cat(input$chars,'| ')
    #             cat(input$cursorPos,'| ')
    #         })
    #     })
    # }
    
    # observe({
    #     selectedCharGroup$chars
    #     newChars <- selectedCharGroup$chars
    #     if (!is.null(newChars)){
    #         ids <- newChars
    #         for (id in ids) {
    #             local({
    #                 my_id <- id
    #                 shinyjs::onclick(my_id, {
    #                     cat(my_id,'| ')
    #                     cat(input$chars,'| ')
    #                     cat(input$cursorPos,'| ')
    #                 })
    #             })
    #         }
    #     }
    # })
    
    
    # output$out <- renderText({
    #     "here I would like to get the cursor position (an interger?) \n inside que textArea"
    #     
    # })
    # 
    # observeEvent(input$hop,{
    #     message("hop")
    #     session$sendCustomMessage(type="prout",message=list(NULL))
    # })
    # 
    
    
    
    
    
    
    
  # dataset =  read.csv('C:/Users/GCE Employee/Desktop/KEYBOARD/characters2.csv',   encoding = "UTF-8" , stringsAsFactors=FALSE)
  # dats<<- dataset
  # message6 = toJSON(dataset)
  # message6 <<- message
  # session$sendCustomMessage("handler10", message6)
  # # listen to the action button
    
    

    
  # for (j in c('hi','hi2')){
  #     onclick(j,cat(j))
  # }
   # onclick('hi', cat('vienas'))
   # onclick('hi2', cat('du'))
    
  observeEvent(input$update,{
    
    updateTextInput(session,'chars','Enter Text',value=input$update)
  })  
  observeEvent(input$mydata,{
      cat(input$mydata)
      
  }) 
  
  
  observeEvent(input$btn10,{
      
      showModal(modalDialog(
          title = "Important message",
          bsModal("modalExample", "Data Table", "tabBut", size = "large",
                  includeHTML('www/kiril.html'))
              
          )
      )
     
  })  
  
  
  observeEvent(input$btn1,{
      
    
    # a simple text string
    message = "hello"
    
    # send the message to the event handler with name handler1 if we press the action button
    session$sendCustomMessage("handler1", message)
  })         
  
  # this block fires each time we receive a message from JavaScript
  output$text <- renderText({
    
    req(input$count)
    
    paste("you clicked", input$count, "times on the RStudio ball")
  })
  
})