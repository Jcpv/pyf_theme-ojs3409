
const saveConfig = (config) => {
    localStorage.setItem("liminarConfig", JSON.stringify(config));
}

const loadConfig = () => {
    let config = localStorage.getItem('liminarConfig');

    if (!config) {
        const el = document.body;
        const style = window.getComputedStyle(el, null).getPropertyValue('font-size');
        const fontSize = parseFloat(style);
        
        const liminarConfigDefault = {
            fontSize,
            imgClass: [],
            aClass: [],
            bodyClass: [],
        }

        saveConfig(liminarConfigDefault);
        return liminarConfigDefault;
    }
    return JSON.parse(config);
}

const resetConfig = () => {
    localStorage.removeItem("liminarConfig");
    window.location.reload();
}

const sizeFont = (config, incr) => {
    const el = document.body;

    if ( incr ) {
        const style = window.getComputedStyle(el, null).getPropertyValue('font-size');
        const fontSize = parseFloat(style);
        // now you have a proper float for the font size (yes, it can be a float, not just an integer)
        config.fontSize = fontSize * incr;
        saveConfig(config);
    } 
    el.style.fontSize = config.fontSize + 'px';
}


const pageInvert = (classname) => {
    const el = document.body;
    const config = loadConfig();
    let bodyClass = config.bodyClass.filter((item,index, arrayNew)=>{
        return arrayNew.indexOf(item) === index;
    })
    const active = document.getElementById(`accessibility-${classname}`);
    const elements = document.getElementsByClassName(classname).length;

    if (elements) {
        el.classList.remove(classname);
        config.bodyClass = bodyClass.filter((item, index, arrayNew)=>{
            return arrayNew[index] !== classname;
        });
        active.classList.remove("bg-danger");
    } else { 
        el.classList.add(classname);
        if (bodyClass.indexOf(classname) < 0) bodyClass.push(classname);
        config.bodyClass = bodyClass;
        active.classList.add("bg-danger");
    }

    saveConfig(config);
}


const imgClass = (classname) => {
    const config = loadConfig();
    let imgClass = config.imgClass.filter((item,index, arrayNew)=>{
        return arrayNew.indexOf(item) === index;
    });
    const active = document.getElementById(`accessibility-${classname}`);
    const elements = document.getElementsByClassName(classname).length;
    const images = document.getElementsByTagName("img");
    
    Array.from(images, (ele) => {
        elements ? 
        ele.classList.remove(classname) :
        ele.classList.add(classname);
    })

    if (elements) { 
        config.imgClass = imgClass.filter((item, index, arrayNew)=>{
            return arrayNew[index] !== classname;
        });
        active.classList.remove("bg-danger");
    } else { 
        if (imgClass.indexOf(classname) < 0) imgClass.push(classname);
        config.imgClass = imgClass;
        active.classList.add("bg-danger");
    }

    saveConfig(config);
}


const aClass = (classname) => {
    const config = loadConfig();
    let aClass = config.aClass.filter((item,index, arrayNew)=>{
        return arrayNew.indexOf(item) === index;
    })
    const active = document.getElementById(`accessibility-${classname}`);
    const elements = document.getElementsByClassName(classname).length;
    const links = document.getElementsByTagName("a")
    
    Array.from(links, (ele) => {
        elements ? 
        ele.classList.remove(classname) :
        ele.classList.add(classname);
    })

    if (elements) { 
        config.aClass = aClass.filter((item, index, arrayNew)=>{
            return arrayNew[index] !== classname;
        });
        active.classList.remove("bg-danger");
    } else { 
        if (aClass.indexOf(classname) < 0) aClass.push(classname);
        config.aClass = aClass;
        active.classList.add("bg-danger");
    }

    saveConfig(config);
}


window.addEventListener('load', () => {
    const liminaraccessibility = loadConfig();
    sizeFont(liminaraccessibility);

    for( const imgclass of liminaraccessibility.imgClass ) {
        imgClass(imgclass)
    }
    for( const aclass of liminaraccessibility.aClass ) {
        aClass(aclass)
    }
    for( const bodyclass of liminaraccessibility.bodyClass ) {
        pageInvert(bodyclass)
    }

    const btnIncrFont = document.getElementById("accessibility-increasefont")
    if ( btnIncrFont ) {
        btnIncrFont.addEventListener("click", () => sizeFont(liminaraccessibility, 1.1));
    }

    const btnDecrFont = document.getElementById("accessibility-decreasefont")
    if ( btnDecrFont ) {
        btnDecrFont.addEventListener("click", () => sizeFont(liminaraccessibility, 0.9));
    }
    
    const btnPageInvert = document.getElementById("accessibility-pageinvert");
    if ( btnPageInvert ) {
        btnPageInvert.addEventListener("click", () => pageInvert("pageinvert"));
    }

    const btnReset = document.getElementById("accessibility-reset");
    if ( btnReset ) {
        btnReset.addEventListener("click", () => resetConfig());
    }
    
    const btnGrayscale = document.getElementById("accessibility-imggrayscale");
    if ( btnGrayscale ) {
        btnGrayscale.addEventListener("click", () => imgClass("imggrayscale"));
    }

    const btnInvert = document.getElementById("accessibility-imginvert");
    if ( btnInvert ) {
        btnInvert.addEventListener("click", () => imgClass("imginvert"));
    }

    const btnHighlight = document.getElementById("accessibility-linkhighlight");
    if ( btnHighlight ) {
        btnHighlight.addEventListener("click", () => aClass("linkhighlight"));
    }


});
