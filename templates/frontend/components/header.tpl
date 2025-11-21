{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	<div class="pkp_structure_page">

		<nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
			<ul>
			  <li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
			  <li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
			  <li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
			</ul>
		</nav>

		{* Header *}
		<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

			<div class="container-fluid bg-fondo-oscuro">

				{* - Jc - Ajustar Menu de accesibilidad 2 *}
				<div class="bg-fondo-1 p-3 m-0 menu-flotante">
				{include file="frontend/components/accessibility2.tpl"}
				</div>

				{* - Jc - Ajustar imagen del BANNER *}
				<div class="row bg-fondo-oscuro pt-5 pb-0 mt-0">
					<div class="colP-sm-12 colP-md-1" >
						<div class="row justify-content-center">
							<div class="colP-2 colP-sm-2 colP-md-12 colP-lg-9">
								<div class="px-2 py-4 text-center ">
									<a href="https://www.unam.mx" target="_blank">
										<img src="{$publicFilesDir}/logo_unam_bco.png" class="img-fluid" alt="UNAM" title="UNAM">
									</a>
								</div>
							</div>
							<div class="colP-2 colP-sm-2 colP-md-12 colP-lg-9">
								<div class="px-2 py-3">
									<a href="https://www.cimsur.unam.mx/index.php/inicio" target="_blank">
										<img src="{$publicFilesDir}/logo_cimsur_bco.png" class="img-fluid" alt="Cimsur" title="Cimsur">
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="colP-sm-12 colP-md-11 p-0" >
						<div class="m-0 p-0 pr-2 text-left ">
							<a href="{$homeUrl}" class="is_img ">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} class="img-fluid">
							</a>
						</div>
					</div>
								
				</div>
				{* /Jc *}
			
				<div class="navbar-header">

					{* Mobile hamburger menu *}
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false" aria-controls="nav-menu">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					{* Logo or site title. Only use <h1> heading on the homepage.
					   Otherwise that should go to the page title. *}
					{*	{if $requestedOp == 'index'}
						<h1 class="site-name">
					{else}
						<div class="site-name">
					{/if}
						{capture assign="homeUrl"}
							{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
						{/capture}
						{if $displayPageHeaderLogo}
							<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if}>
							</a>
						{elseif $displayPageHeaderTitle}
							<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
						{else}
							<a href="{$homeUrl}" class="navbar-brand">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
							</a>
						{/if} 


					{if $requestedOp == 'index'}
						</h1>
					{else}
						</div>
					{/if} *}

				</div>

				{* Primary site navigation *}
				{capture assign="primaryMenu"}
					{load_menu name="primary" id="main-navigation" ulClass="nav navbar-nav"}
				{/capture}

				{if !empty(trim($primaryMenu)) || $currentContext}
					{* - Jc - Menú: cambiar tamaño de texto *} 
					<nav id="nav-menu" class="navbar-collapse collapse p-0 m-0" aria-label="{translate|escape key="common.navigation.site"}" style="font-size: 1.4em!important;">
						{* Primary navigation menu for current application *}
						{$primaryMenu}
						
						{include file="frontend/components/accessibility.tpl"}

						{* User profile, login, etc, navigation menu*}
						{* - Jc - Ajustar Menú de LOGIN / Perfil*}
						<div class="pull-md-right">
							<div class="row p-2">
								<nav aria-label="{translate|escape key="common.navigation.user"}">
									{load_menu name="user" id="navigationUser" ulClass="nav nav-pills tab-list pull-right"}
								</nav>
							</div><!-- .row -->
						</div><!-- .container-fluid -->
						{* /Jc *}

						{* Search form *}
						{if $currentContext}
							<div class="pull-md-right m-0 p-0">
								{include file="frontend/components/searchForm_simple.tpl"}
							</div>
						{/if}
					</nav>
				{/if}

			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">
