/*********************************************
 * GUARDAR / CARGAR CONFIGURACIÓN
 *********************************************/
const saveConfig = (config) => {
    localStorage.setItem("liminarConfig", JSON.stringify(config));
}

const loadConfig = () => {
    let config = localStorage.getItem('liminarConfig');

    if (!config) {
        const fontSize = parseFloat(window.getComputedStyle(document.body).fontSize);
        const defaultConfig = { fontSize, imgClass: [], aClass: [], bodyClass: [] };
        saveConfig(defaultConfig);
        return defaultConfig;
    }

    return JSON.parse(config);
}

const resetConfig = () => {
    localStorage.removeItem("liminarConfig");
    window.location.reload();
}

/*********************************************
 * AJUSTE DE TAMAÑO DE FUENTE
 *********************************************/
const sizeFont = (config, incr) => {
    const el = document.body;

    if (incr) {
        const style = window.getComputedStyle(el).getPropertyValue('font-size');
        const fontSize = parseFloat(style);
        config.fontSize = fontSize * incr;
        saveConfig(config);
    }

    el.style.fontSize = config.fontSize + 'px';
}

/*********************************************
 * FUNCIONES ORIGINALES QUE FUNCIONABAN
 *********************************************/
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

/*********************************************
 * MODOS EXCLUSIVOS NUEVOS
 *********************************************/
const exclusiveModes = ["darkmode","high-contrast","invert-colors","protanopia","deuteranopia","tritanopia"];

const activateExclusiveMode = (classname) => {
    const config = loadConfig();
    const body = document.body;

    // Quitar todos los modos exclusivos activos
    exclusiveModes.forEach(mode => {
        if (body.classList.contains(mode)) {
            body.classList.remove(mode);
            const btn = document.getElementById(`accessibility-${mode}`);
            if (btn) btn.classList.remove("bg-danger");
            config.bodyClass = config.bodyClass.filter(c => c !== mode);
        }
    });

    // Activar el nuevo modo
    body.classList.add(classname);
    if (!config.bodyClass.includes(classname)) config.bodyClass.push(classname);
    const active = document.getElementById(`accessibility-${classname}`);
    if (active) active.classList.add("bg-danger");

    saveConfig(config);
}

/*********************************************
 * INICIALIZACIÓN
 *********************************************/
window.addEventListener('load', () => {
    const config = loadConfig();

    // Aplicar tamaño de fuente
    sizeFont(config);

    // Restaurar clases guardadas (img, links, body)
    config.imgClass.forEach(c => imgClass(c));
    config.aClass.forEach(c => aClass(c));
    config.bodyClass.forEach(c => pageInvert(c));

    // Botones existentes
    document.getElementById("accessibility-increasefont")?.addEventListener("click", () => sizeFont(config, 1.1));
    document.getElementById("accessibility-decreasefont")?.addEventListener("click", () => sizeFont(config, 0.9));
    document.getElementById("accessibility-linkhighlight")?.addEventListener("click", () => aClass("linkhighlight"));
    document.getElementById("accessibility-imggrayscale")?.addEventListener("click", () => imgClass("imggrayscale"));
    document.getElementById("accessibility-reset")?.addEventListener("click", () => resetConfig());

    // Botones de modos exclusivos
    document.getElementById("accessibility-darkmode")?.addEventListener("click", () => activateExclusiveMode("darkmode"));
    document.getElementById("accessibility-high-contrast")?.addEventListener("click", () => activateExclusiveMode("high-contrast"));
    document.getElementById("accessibility-invert-colors")?.addEventListener("click", () => activateExclusiveMode("invert-colors"));
    document.getElementById("accessibility-protanopia")?.addEventListener("click", () => activateExclusiveMode("protanopia"));
    document.getElementById("accessibility-deuteranopia")?.addEventListener("click", () => activateExclusiveMode("deuteranopia"));
    document.getElementById("accessibility-tritanopia")?.addEventListener("click", () => activateExclusiveMode("tritanopia"));
});
