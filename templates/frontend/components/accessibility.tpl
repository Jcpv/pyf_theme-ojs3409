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
            </li> *}

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
            </li> *}
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