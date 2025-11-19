  
var scripts = document.getElementsByTagName("script");
var thisScriptSrc = scripts[scripts.length - 1].src;
var currentFolder = thisScriptSrc.substring(0, thisScriptSrc.lastIndexOf('/'));


$(function(){
    
    var _content = $('#customblock-indexada-en .content')
    _content.find('a').unwrap();

    _title = _content.find('p');
    _content.find('p').remove();

    var sliderElems = _content.html();
    _content.html('');

    _title.appendTo(_content)

    var sliderContainer = $('<div/>', {
            id: 'sliderContainer'
        })
        .html(sliderElems)
        .appendTo(_content)


    slickAttr = {
        infinite: true,
        dots: true,
        autoplay: true,
        arrows: false,
        responsive: [{
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                    infinite: true, 
                    dots: false,
                }
            }


        ]




    }



sliderContainer.slick(slickAttr);


/*
    $.getScript(currentJournal + "/slick.min.js", function() {


        sliderContainer.slick(slickAttr);
  

    })
*/


})