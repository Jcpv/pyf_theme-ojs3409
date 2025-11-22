{*
<ul id="accessibility" class="nav navbar-nav">

    <li class="{$liClass|escape} menu-item-100  dropdown">
        <a href=" " class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">
            {translate key="plugins.accesibility.title"}
            <i class="fas fa-wheelchair"></i> <span class="caret"></span>
        </a>
        <ul class="dropdown-menu dropdown-menu-right">

            <li class="" id="accessibility-increasefont">
                <a class="dropdown-item">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor" d="M5 4v2h6v14h2V6h6V4H5z" />
                    </svg>

                    {translate key="plugins.accesibility.increasefont"}
                </a>
            </li>
            <li class="" id="accessibility-decreasefont">
                <a class="dropdown-item">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor" d="M6 10v2h12v-2H6z" />
                    </svg>
                    {translate key="plugins.accesibility.decreasefont"}
                </a>
            </li>

            <li class="" id="accessibility-linkhighlight">
                <a class="dropdown-item">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor"
                            d="M3.9 12A5 5 0 0 1 9 7h4v2H9a3 3 0 1 0 0 6h4v2H9a5 5 0 0 1-5.1-5Zm7.1 1h4a3 3 0 0 0 0-6h-4V5h4a5 5 0 1 1 0 10h-4v-2Z" />
                    </svg>
                    {translate key="plugins.accesibility.linkhighlight"}
                </a>
            </li>

            {*<li class="" id="accessibility-pageinvert">
                <a class="dropdown-item" >
                    {translate key="plugins.accesibility.pageinvert"}
                </a>
            </li> * }

            <li class="" id="accessibility-imggrayscale">
                <a class="dropdown-item ">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor" d="M12 3a9 9 0 1 0 9 9h-9V3Z" />
                    </svg>
                    {translate key="plugins.accesibility.imggrayscale"}
                </a>
            </li>

            <li class="" id="accessibility-darkmode">
                <a class="dropdown-item ">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor" d="M12 3a9 9 0 1 0 9 9a7 7 0 0 1-9-9Z" />
                    </svg>
                    Modo oscuro
                </a>
            </li>

            {*<li class="" id="accessibility-imginvert">
                <a class="dropdown-item" >
                    {translate key="plugins.accesibility.imginvert"}
                </a>
            </li> * }
            <hr />
            <li class="N" id="accessibility-reset">
                <a class="dropdown-item">
                    <svg width="18" height="18" viewBox="0 0 24 24" style="margin-right:6px">
                        <path fill="currentColor"
                            d="M12 5V1L7 6l5 5V7c3.3 0 6 2.7 6 6a6 6 0 0 1-6 6a6 6 0 0 1-5.65-4H4.26A8 8 0 0 0 20 13c0-4.4-3.6-8-8-8Z" />
                    </svg>
                    {translate key="plugins.accesibility.reset"}
                </a>
            </li>

        </ul>
    </li>
</ul>

*}

<div class="btn-toolbar m-0 p-0 ">
    <div class="collapse mr-2 p-1" id="area-accesibilidad">
        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-increasefont"
            data-toggle="tooltip" data-placement="bottom" title="{translate key="plugins.accesibility.increasefont"}">
            <span class="material-symbols-outlined">
                text_increase
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-decreasefont"
            data-toggle="tooltip" data-placement="bottom" title="{translate key="plugins.accesibility.decreasefont"}">
            <span class="material-symbols-outlined">
                text_decrease
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-linkhighlight"
            data-toggle="tooltip" data-placement="bottom" title="{translate key="plugins.accesibility.linkhighlight"}">
            <span class="material-symbols-outlined">
                link
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-imggrayscale"
            data-toggle="tooltip" data-placement="bottom" title="{translate key="plugins.accesibility.imggrayscale"}">
            <span class="material-symbols-outlined">
                monochrome_photos
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-darkmode"
            data-toggle="tooltip" data-placement="bottom" title="Modo oscuro">
            <span class="material-symbols-outlined">
                dark_mode
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-high-contrast"
            data-toggle="tooltip" data-placement="bottom" title="Alto contraste">
            {*<span class="material-symbols-outlined">
             contrast
         </span> *}
            <span class="material-symbols-outlined">
                filter_b_and_w
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-invert-colors"
            data-toggle="tooltip" data-placement="bottom" title="Invertir colores">
            <span class="material-symbols-outlined">
                invert_colors
            </span>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-protanopia"
            data-toggle="tooltip" data-placement="bottom" title="Protanopia">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24">
                <circle cx="12" cy="12" r="10" stroke="#000" stroke-width="3" />
                <line x1="6" y1="6" x2="18" y2="18" stroke="red" stroke-width="3" />
            </svg>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-deuteranopia"
            data-toggle="tooltip" data-placement="bottom" title="Deuteranopia">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none">
                <circle cx="12" cy="12" r="10" stroke="#000" stroke-width="3" />
                <line x1="6" y1="6" x2="18" y2="18" stroke="green" stroke-width="3" />
            </svg>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-tritanopia"
            data-toggle="tooltip" data-placement="bottom" title="Tritanopia">
            <svg width="22" height="22" viewBox="0 0 24 24">
                <circle cx="12" cy="12" r="10" stroke="#000" stroke-width="3" />
                <line x1="6" y1="6" x2="18" y2="18" stroke="blue" stroke-width="3" />
            </svg>
        </button>

        <button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-reset"
            data-toggle="tooltip" data-placement="bottom" title="{translate key="plugins.accesibility.reset"}">
            <span class="material-symbols-outlined">
                settings_backup_restore
            </span>
        </button>

        {*<button type="button" class="btn btn-outline-primary border-0 m-0 px-3 py-1" id="accessibility-menu"
            data-toggle="tooltip" data-placement="bottom" title="Menú de accesibilidad">
            <span class="material-symbols-outlined">
                accessible_forward
            </span>
        </button> *}
    </div>
    <div class="m-0 p-0" data-toggle="tooltip" data-placement="bottom"
        title="Ver opciones de accesibilidad">
        <button type="button" class="btn btn-ligth border-0 m-0 p-2" data-toggle="collapse"
            data-target="#area-accesibilidad" aria-expanded="false" aria-controls="area-accesibilidad"> <span
                class="material-symbols-outlined text-danger-7">accessible_forward</span>
        </button>
    </div>
</div>